import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:realestateapplication/app/usecase/usecase.dart';
import 'package:realestateapplication/features/auth/domain/entity/auth_entity.dart';

import '../../../../core/error/failure.dart';
import '../repository/auth_repository.dart';

class RegisterUserParams extends Equatable {
  final String? userId;
  final String fullname;
  final String email;
  final String password;

  const RegisterUserParams({
    this.userId,
    required this.fullname,
    required this.email,
    required this.password,
  });

  const RegisterUserParams.initial({
    this.userId,
    required this.fullname,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [userId, fullname, email, password];
}

class RegisterUseCase implements UsecaseWithParams<void, RegisterUserParams> {
  final IAuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) async {
    try {
      final authEntity = AuthEntity(
        userId: params.userId,
        fullname: params.fullname,
        email: params.email,
        password: params.password,
      );

      return await repository.registerUser(authEntity);
    } catch (e) {
      // Log or handle the error if necessary
      return Left(Failure(message: 'Registration failed: ${e.toString()}'));
    }
  }
}
