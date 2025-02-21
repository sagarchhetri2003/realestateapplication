import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:realestateapplication/core/error/failure.dart';
import 'package:realestateapplication/features/auth/domain/use_case/signup_usecase.dart';
import 'package:realestateapplication/features/auth/domain/use_case/upload_image_usecase.dart';
import 'package:realestateapplication/features/auth/presentation/view_model/signup/bloc/signup_bloc.dart';

// 🔥 Mock dependencies
class MockSignupUseCase extends Mock implements SignupUsecase {}

class MockUploadImageUsecase extends Mock implements UploadImageUsecase {}

class MockSignupUserParams extends Mock implements SignupUserParams {}

class MockUploadImageParams extends Mock implements UploadImageParams {}

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  late SignupBloc signupBloc;
  late MockSignupUseCase signupUseCase;
  late MockUploadImageUsecase uploadImageUsecase;
  late MockBuildContext mockContext;
  late MockSignupUserParams mockSignupUserParams;
  late MockUploadImageParams mockUploadImageParams;

  setUp(() {
    signupUseCase = MockSignupUseCase();
    uploadImageUsecase = MockUploadImageUsecase();
    mockContext = MockBuildContext();
    mockSignupUserParams = MockSignupUserParams();
    mockUploadImageParams = MockUploadImageParams();

    signupBloc = SignupBloc(
      signupUseCase: signupUseCase,
      uploadImageUseCase: uploadImageUsecase,
    );

    //  Register Fallback Values for Mocktail
    registerFallbackValue(mockSignupUserParams);
    registerFallbackValue(mockUploadImageParams);
  });

  group('SignupBloc Tests', () {
    const FullName = "Test User";
    const email = "test@gmail.com";
    const phonenumber = "1234567890";
    const address = "Test Address";
    const password = "password123";
    final file = File('test_image.png');
    const imageName = "uploaded_image.png";

    blocTest<SignupBloc, SignupState>(
      'emits [isLoading=true, isSuccess=true] when registration succeeds',
      build: () {
        when(() => signupUseCase.call(any()))
            .thenAnswer((_) async => const Right(null));
        return signupBloc;
      },
      act: (bloc) => bloc.add(SignupUser(
        fullName: FullName,
        email: email,
        phonenumber: phonenumber,
        address: address,
        password: password,
        context: mockContext, // ✅ Using Mocked Context
      )),
      expect: () => [
        SignupState.initial().copyWith(isLoading: true),
        SignupState.initial().copyWith(isLoading: false, isSuccess: true),
      ],
      verify: (_) {
        verify(() => signupUseCase.call(any())).called(1);
      },
    );

    blocTest<SignupBloc, SignupState>(
      ' emits [isLoading=true, isSuccess=false] when registration fails',
      build: () {
        when(() => signupUseCase.call(any())).thenAnswer((_) async =>
            const Left(ApiFailure(message: "Registration failed")));
        return signupBloc;
      },
      act: (bloc) => bloc.add(SignupUser(
          fullName: FullName,
          email: email,
          phonenumber: phonenumber,
          address: address,
          password: password,
          context: mockContext)), // ✅ Using Mocked Context
      expect: () => [
        SignupState.initial().copyWith(isLoading: true),
        SignupState.initial().copyWith(isLoading: false, isSuccess: false),
      ],
      verify: (_) {
        verify(() => signupUseCase.call(any())).called(1);
      },
    );

    blocTest<SignupBloc, SignupState>(
      ' emits [isLoading=true, isSuccess=true, imageName=uploaded_image.png] when image upload succeeds',
      build: () {
        when(() => uploadImageUsecase.call(any()))
            .thenAnswer((_) async => const Right(imageName));
        return signupBloc;
      },
      act: (bloc) => bloc.add(LoadImage(file: file)), // ✅ Using Mocked File
      expect: () => [
        SignupState.initial().copyWith(isLoading: true),
        SignupState.initial()
            .copyWith(isLoading: false, isSuccess: true, imageName: imageName),
      ],
      verify: (_) {
        verify(() => uploadImageUsecase.call(any())).called(1);
      },
    );

    blocTest<SignupBloc, SignupState>(
      ' emits [isLoading=true, isSuccess=false] when image upload fails',
      build: () {
        when(() => uploadImageUsecase.call(any())).thenAnswer((_) async =>
            const Left(ApiFailure(message: "Image upload failed")));
        return signupBloc;
      },
      act: (bloc) => bloc.add(LoadImage(file: file)), // ✅ Using Mocked File
      expect: () => [
        SignupState.initial().copyWith(isLoading: true),
        SignupState.initial().copyWith(isLoading: false, isSuccess: false),
      ],
      verify: (_) {
        verify(() => uploadImageUsecase.call(any())).called(1);
      },
    );
  });

  tearDown(() {
    reset(signupUseCase);
    reset(uploadImageUsecase);
  });
}
