import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:realestateapplication/core/error/failure.dart';

import '../entity/auth_entity.dart';

abstract interface class IAuthRepository {
  Future<Either<Failure, void>> registerUser(AuthEntity user);

  Future<Either<Failure, String>> loginUser(String email, String password);

  Future<Either<Failure, AuthEntity>> getCurrentUser();

  Future<Either<Failure, String>> uploadProfilePicture(File file);
}
