// import 'package:realestateapplication/core/network/hive_service.dart';
// import 'package:realestateapplication/features/course/data/data_source/course_data_source.dart';
// // import 'package:softwarica_student_management_bloc/core/network/hive_service.dart';

// // import 'package:softwarica_student_management_bloc/features/batch/data/model/batch_hive_model.dart';
// // import 'package:softwarica_student_management_bloc/features/batch/domain/entity/batch_entity.dart';
// // import 'package:softwarica_student_management_bloc/features/course/data/data_source/course_data_source.dart';

// import '../../../domain/entity/course_entity.dart';
// import '../../model/course_hive_model.dart';

// class CourseLocalDataSource implements ICourseDataSource {
//   final HiveService _hiveService;
//   CourseLocalDataSource(this._hiveService);

//   @override
//   Future<void> createCourse(CourseEntity courseEntity) async {
//     try {
//       final courseHiveModel = CourseHiveModel.fromEntity(courseEntity);
//       await _hiveService.addCourse(courseHiveModel);
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   @override
//   Future<void> deleteCourse(id) async {
//     try {
//       return await _hiveService.deleteCourse(id);
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   @override
//   Future<List<CourseEntity>> getAllCourses() {
//     // TODO: implement getAllCourses
//     throw UnimplementedError();
//   }

// // @override
// // Future<List<BatchEntity>> getAllBatches() {
// //   try{
// //     return _hiveService.getAllBatches().then((value){
// //       return value.map((e) => e.toEntity()).toList();
// //
// //     });
// //         } catch(e){
// //     throw Exception(e);
// //   }
// // }
// }
