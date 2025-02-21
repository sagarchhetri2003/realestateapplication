import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:realestateapplication/core/error/failure.dart';
import 'package:realestateapplication/features/auth/domain/entity/auth_entity.dart';
import 'package:realestateapplication/features/auth/domain/use_case/signup_usecase.dart';

import 'login_use_case_test.dart';

void main() {
  late SignupUsecase useCase;
  late MockAuthRepository repository;

  setUp(() {
    repository = MockAuthRepository();
    useCase = SignupUsecase(repository);
  });

  const registerParams = SignupUserParams(
    userId: '1',
    email: 'test@gmail.com',
    fullName: 'Test User',
    phonenumber: '1234567890',
    address: 'Test Address',
    image: 'test_image.png',
    password: 'test1234',
  );

  final authEntity = AuthEntity(
    userId: registerParams.userId,
    email: registerParams.email,
    fullName: registerParams.fullName,
    password: registerParams.password,
    phonenumber: registerParams.phonenumber,
    address: registerParams.address,
    image: registerParams.image,
  );

  test('should call registerUser in the repository with correct params',
      () async {
    // Arrange
    when(() => repository.registerUser(authEntity))
        .thenAnswer((_) async => const Right(null));

    // Act
    final result = await useCase(registerParams);

    // Assert
    expect(result, const Right(null));
    verify(() => repository.registerUser(authEntity)).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('should return Left(Failure) when registration fails', () async {
    // Arrange
    var failure = ApiFailure(message: 'Registration failed');
    when(() => repository.registerUser(authEntity))
        .thenAnswer((_) async => Left(failure));

    // Act
    final result = await useCase(registerParams);

    // Assert
    expect(result, Left(failure));
    verify(() => repository.registerUser(authEntity)).called(1);
    verifyNoMoreInteractions(repository);
  });
}
