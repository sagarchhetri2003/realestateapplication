import 'package:dartz/dartz.dart';
import 'package:softwarica_student_management_bloc/core/error/failure.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/entity/student_entity.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/repository/auth_repository.dart';


import '../data_source/local_datasource/local_datasource.dart';

class AuthLocalRepository implements IAuthRepository{
  final AuthLocalDataSource _authLocalDataSource;

  AuthLocalRepository({required AuthLocalDataSource authLocalDataSource})
      : _authLocalDataSource=authLocalDataSource;

  @override
  Future<Either<Failure, void>> createStudent(StudentEntity studentEntity) {
    try{
      _authLocalDataSource.createStudent(studentEntity);
      return Future.value(Right(null));
    }catch(e){
      return Future.value(Left(LocalDatabaseFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<Failure, void>> deleteStudent(id) async{
    try{
      await _authLocalDataSource.deleteStudent(id);
      return Right(null);
    }
    catch(e){
      return Left(
        LocalDatabaseFailure(message: 'error deleting all batches:$e'),
      );
    }
  }

  @override
  Future<Either<Failure, List<StudentEntity>>> getAllStudents()async {
    try{
      final students=await _authLocalDataSource.getAllStudents();
      return Right(students);
    }catch (e){
      return Left(
        LocalDatabaseFailure(message: 'error getting all batches: $e'),
      );
    }
  }

}