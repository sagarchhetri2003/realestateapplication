import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:realestateapplication/app/shared_prefs/token_shared_prefs.dart';
import 'package:realestateapplication/core/error/failure.dart';
import 'package:realestateapplication/features/auth/domain/repository/auth_repository.dart';
import 'package:realestateapplication/features/auth/domain/use_case/login_use_case.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

class MockTokenSharedPrefs extends Mock implements TokenSharedPrefs {}

void main() {
  late MockAuthRepository repository;
  late MockTokenSharedPrefs tokenSharedPrefs;
  late LoginUsecase usecase;

  setUp(() {
    repository = MockAuthRepository();
    tokenSharedPrefs = MockTokenSharedPrefs();
    usecase = LoginUsecase(
        authRepository: repository, tokenSharedPrefs: tokenSharedPrefs);

    registerFallbackValue(
        const LoginUserParams(email: 'test@gmail.com', password: 'test123'));
  });

  test(
      'should call the [AuthRepo.login] with correct email and password (anjali@gmail.com, anjali123)',
      () async {
    when(() => repository.loginUser(any(), any())).thenAnswer(
      (invocation) async {
        final email = invocation.positionalArguments[0] as String;
        final password = invocation.positionalArguments[1] as String;
        if (email == 'sagar@gmail.com' && password == 'sagar123') {
          return Future.value(const Right('token'));
        } else {
          return Future.value(
              Left(ApiFailure(message: 'Invalid email or password')));
        }
      },
    );

    when(() => tokenSharedPrefs.saveToken(any())).thenAnswer(
      (_) async => const Right(null),
    );

    final result = await usecase(
        const LoginUserParams(email: 'sagar@gmail.com', password: 'sagar123'));

    expect(result, const Right('token'));

    verify(() => repository.loginUser(any(), any())).called(1);
    verify(() => tokenSharedPrefs.saveToken(any())).called(1);

    verifyNoMoreInteractions(repository);
    verifyNoMoreInteractions(tokenSharedPrefs);
  });

  test('should return a token when login is successful', () async {
    const email = 'sagar@gmail.com';
    const password = 'sagar123';
    const token = 'mock_token';
    const loginParams = LoginUserParams(email: email, password: password);

    when(() => repository.loginUser(any(), any()))
        .thenAnswer((_) async => const Right(token));

    when(() => tokenSharedPrefs.saveToken(any()))
        .thenAnswer((_) async => const Right(null));

    when(() => tokenSharedPrefs.getToken())
        .thenAnswer((_) async => Future.value(const Right(token)));

    final result = await usecase(loginParams);

    expect(result, const Right(token));

    verify(() => repository.loginUser(email, password)).called(1);
    verify(() => tokenSharedPrefs.saveToken(token)).called(1);
    // verify(() => tokenSharedPrefs.getToken()).called(1);
  });

  test('should return a failure when login fails', () async {
    when(() => repository.loginUser(any(), any())).thenAnswer(
      (_) async => Left(ApiFailure(message: "Invalid login")),
    );

    final result = await usecase(
        const LoginUserParams(email: 'wrong@gmail.com', password: 'wrongPass'));

    expect(result, Left(ApiFailure(message: "Invalid login")));

    verify(() => repository.loginUser(any(), any())).called(1);
    verifyNever(() => tokenSharedPrefs.saveToken(any()));
  });

  tearDown(() {
    reset(repository);
    reset(tokenSharedPrefs);
  });
}
