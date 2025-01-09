import 'package:dartz/dartz.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/entity/student_entity.dart';

import '../../../../core/error/failure.dart';

abstract interface class IAuthRepository{
  Future <Either <Failure, void>> createStudent(StudentEntity studentEntity);
  Future <Either <Failure, List<StudentEntity>>> getAllStudents();
  Future <Either <Failure, void>> deleteStudent(String id);
}