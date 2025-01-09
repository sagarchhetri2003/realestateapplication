import 'package:dartz/dartz.dart';

import 'package:softwarica_student_management_bloc/features/course/domain/entity/course_entity.dart';

import '../../../../core/error/failure.dart';

abstract interface class ICourseDataSource{
  Future <void> createCourse(CourseEntity courseEntity);
  Future <List<CourseEntity>> getAllCourses();
  Future <void> deleteCourse(String id);
}