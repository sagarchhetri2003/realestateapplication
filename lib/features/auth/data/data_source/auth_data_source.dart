// import 'package:dartz/dartz.dart';
import 'package:realestateapplication/features/auth/domain/entity/student_entity.dart';



abstract interface class IAuthDataSource{
  Future <void> createStudent(StudentEntity studentEntity);
  Future <List<StudentEntity>> getAllStudents();
  Future <void> deleteStudent(String id);
}