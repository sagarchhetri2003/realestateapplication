// import 'package:hive_flutter/adapters.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:softwarica_student_management_bloc/app/constants/hive_table_constant.dart';
// import 'package:softwarica_student_management_bloc/features/auth/data/model/auth_hive_model.dart';
// import 'package:softwarica_student_management_bloc/features/batch/data/model/batch_hive_model.dart';
// import 'package:softwarica_student_management_bloc/features/course/data/model/course_hive_model.dart';

// class HiveService {
//   Future<void> init() async {
//     //Initialize the bd
//     var directory = await getApplicationCacheDirectory();
//     var path = '${directory.path}softwarica_student_management.db';

//     Hive.init(path);

//     Hive.registerAdapter(CourseHiveModelAdapter());
//     Hive.registerAdapter(BatchHiveModelAdapter());
//     Hive.registerAdapter(AuthHiveModelAdapter());

//   }

//   // Batch Queries
//   Future<void> addBatch(BatchHiveModel batch) async {
//     var box= await Hive.openBox<BatchHiveModel>(HiveTableConstant.batchBox);
//     await box.put(batch.batchId,batch);
//   }

//   Future<void> deleteBatch(String id) async {
//     var box= await Hive.openBox<BatchHiveModel>(HiveTableConstant.batchBox);
//     await box.delete(id);
//   }

//   Future<List <BatchHiveModel>> getAllBatches() async {
//     var box= await Hive.openBox<BatchHiveModel>(HiveTableConstant.batchBox);
//     var batches=box.values.toList();
//     return batches;
//   }

// // Course Queries
//   Future<void> addCourse(CourseHiveModel course) async {
//     var box= await Hive.openBox<CourseHiveModel>(HiveTableConstant.courseBox);
//     await box.put(course.courseId,course);

//   }

//   Future<void> deleteCourse(id) async {
//     var box= await Hive.openBox<CourseHiveModel>(HiveTableConstant.courseBox);
//     await box.delete(id);
//   }

//   Future<List <CourseHiveModel>> getAllCourses() async {
//     var box= await Hive.openBox<CourseHiveModel>(HiveTableConstant.courseBox);
//     var courses=box.values.toList();
//     return courses;
//   }

// // Student Queries
//   Future<void> addStudent(AuthHiveModel auth) async {
//     var box=await Hive.openBox<AuthHiveModel>(HiveTableConstant.studentBox);
//     await box.put(auth.id, auth);
//   }

//   Future<void> deleteStudent(String id) async {
//     var box= await Hive.openBox<AuthHiveModel>(HiveTableConstant.studentBox);
//     await box.delete(id);
//   }

//   Future<List <AuthHiveModel>> getAllStudents() async {
//     var box= await Hive.openBox<AuthHiveModel>(HiveTableConstant.studentBox);
//     return box.values.toList();
//   }

//   Future<AuthHiveModel?> loginStudent(String username, String password) async {
//     var box=await Hive.openBox<AuthHiveModel>(HiveTableConstant.studentBox);
//     var auth = box.values.firstWhere(
//         (element)=>
//             element.username == username && element.password == password,
//         orElse: ()=> AuthHiveModel.initial());
//     return auth;
//   }

//   Future<void> clearAll()async{
//     await Hive.deleteBoxFromDisk(HiveTableConstant.batchBox);
//     await Hive.deleteBoxFromDisk(HiveTableConstant.courseBox);
//     await Hive.deleteBoxFromDisk(HiveTableConstant.studentBox);
//   }

//   Future <void> close() async{
//     await Hive.close();
//   }
// }

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:realestateapplication/app/constants/hive_table_constant.dart';
import 'package:realestateapplication/features/auth/data/model/auth_hive_model.dart';

class HiveService {
  static Future<void> init() async {
    // Initialize the database
    var directory = await getApplicationDocumentsDirectory();
    var path = '${directory.path}realestate.db';

    Hive.init(path);

    // Register Adapters

    Hive.registerAdapter(AuthHiveModelAdapter());
  }

  // Auth Queries
  Future<void> register(AuthHiveModel auth) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    await box.put(auth.userId, auth);
  }

  Future<void> deleteAuth(String id) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    await box.delete(id);
  }

  Future<List<AuthHiveModel>> getAllAuth() async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    return box.values.toList();
  }

  // Login using email and password
  Future<AuthHiveModel?> login(String email, String password) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    var auth = box.values.firstWhere(
        (element) => element.email == email && element.password == password,
        orElse: () => const AuthHiveModel.initial());
    return auth;
  }

  Future<void> clearAll() async {
    await Hive.deleteBoxFromDisk(HiveTableConstant.userBox);
  }

  Future<void> close() async {
    await Hive.close();
  }
}
