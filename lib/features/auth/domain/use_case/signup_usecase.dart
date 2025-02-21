import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../app/usecase/usecase.dart';
import '../../../../core/error/failure.dart';
import '../entity/auth_entity.dart';
import '../repository/auth_repository.dart';

class SignupUserParams extends Equatable {
  final String? userId;
  final String fullName;
  final String phonenumber;
  final String address;
  final String email;
  final String password;
  final String? image;

  const SignupUserParams({
    this.userId,
    required this.email,
    required this.fullName,
    required this.phonenumber,
    required this.address,
    required this.password,
    this.image,
  });

  //intial constructor
  const SignupUserParams.initial({
    this.userId,
    required this.email,
    required this.fullName,
    required this.phonenumber,
    required this.address,
    required this.password,
    this.image,
  });

  @override
  List<Object?> get props =>
      [userId, email, fullName, phonenumber, image, address, password];
}

class SignupUsecase implements UsecaseWithParams<void, SignupUserParams> {
  final IAuthRepository repository;

  SignupUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(SignupUserParams params) {
    final authEntity = AuthEntity(
      userId: params.userId,
      email: params.email,
      fullName: params.fullName,
      phonenumber: params.phonenumber,
      address: params.address,
      password: params.password,
      image: params.image,
    );
    return repository.registerUser(authEntity);
  }
}
