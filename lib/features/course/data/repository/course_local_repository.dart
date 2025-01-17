// import 'package:dartz/dartz.dart';
// import 'package:realestateapplication/core/error/failure.dart';
// import 'package:realestateapplication/features/course/domain/entity/course_entity.dart';
// import 'package:realestateapplication/features/course/domain/repository/course_repository.dart';

// import '../data_source/local_datasource/local_datasource.dart';

// class CourseLocalRepository implements ICourseRepository {
//   final CourseLocalDataSource _courseLocalDataSource;

//   CourseLocalRepository({required CourseLocalDataSource courseLocalDataSource})
//       : _courseLocalDataSource = courseLocalDataSource;

//   @override
//   Future<Either<Failure, void>> createCourse(CourseEntity courseEntity) {
//     try {
//       _courseLocalDataSource.createCourse(courseEntity);
//       return Future.value(Right(null));
//     } catch (e) {
//       return Future.value(Left(LocalDatabaseFailure(message: e.toString())));
//     }
//   }

//   @override
//   Future<Either<Failure, void>> deleteCourse(id) async {
//     try {
//       await _courseLocalDataSource.deleteCourse(id);
//       return Right(null);
//     } catch (e) {
//       return Left(
//         LocalDatabaseFailure(message: 'error deleting all batches:$e'),
//       );
//     }
//   }

//   @override
//   Future<Either<Failure, List<CourseEntity>>> getAllCourses() async {
//     try {
//       final batches = await _courseLocalDataSource.getAllCourses();
//       return Right(batches);
//     } catch (e) {
//       return Left(
//         LocalDatabaseFailure(message: 'error getting all batches: $e'),
//       );
//     }
//   }
// }
