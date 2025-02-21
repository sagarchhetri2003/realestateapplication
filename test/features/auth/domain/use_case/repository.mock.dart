import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:realestateapplication/core/error/failure.dart';
import 'package:realestateapplication/features/auth/domain/entity/auth_entity.dart';
import 'package:realestateapplication/features/auth/domain/repository/auth_repository.dart';

class MockBatchRepository extends Mock implements IAuthRepository {
  @override
  Future<Either<Failure, AuthEntity>> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> loginUser(String email, String password) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> registerUser(AuthEntity user) {
    // TODO: implement registerUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) {
    // TODO: implement uploadProfilePicture
    throw UnimplementedError();
  }
}
