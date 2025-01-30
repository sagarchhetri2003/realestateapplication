
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../app/usecase/usecase.dart';
import '../../../../core/error/failure.dart';
import '../entity/auth_entity.dart';
import '../repository/auth_repository.dart';

class RegisterUserParams extends Equatable {
  final String? userId;
  final String fullname;
  final String phonenumber;
  final String address;
  final String email;
  final String password;

  const RegisterUserParams({
    this.userId,
    required this.email,
    required this.fullname,
    required this.phonenumber,
    required this.address,
    required this.password,
  });

  //intial constructor
  const RegisterUserParams.initial({
    this.userId,
    required this.email,
    required this.fullname,
    required this.phonenumber,
    required this.address,
    required this.password,
  });

  @override
  List<Object?> get props => [userId, email, fullname, phonenumber,address, password];
}

class RegisterUseCase implements UsecaseWithParams<void, RegisterUserParams> {
  final IAuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) {
    final authEntity = AuthEntity(
      userId: params.userId,
      email: params.email,
      fullname: params.fullname,
      phonenumber:  params.phonenumber,
      address:params.address,
      password: params.password,
    );
    return repository.registerUser(authEntity);
  }
}
