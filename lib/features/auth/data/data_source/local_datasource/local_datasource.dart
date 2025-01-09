import 'package:realestateapplication/features/auth/data/data_source/auth_data_source.dart';
import 'package:softwarica_student_management_bloc/core/network/hive_service.dart';
import 'package:softwarica_student_management_bloc/features/auth/data/data_source/auth_data_source.dart';
import 'package:softwarica_student_management_bloc/features/batch/data/data_source/batch_data_source.dart';
import 'package:softwarica_student_management_bloc/features/batch/data/model/batch_hive_model.dart';
import 'package:softwarica_student_management_bloc/features/batch/domain/entity/batch_entity.dart';
import 'package:softwarica_student_management_bloc/features/course/data/data_source/course_data_source.dart';


import '../../../domain/entity/student_entity.dart';
import '../../model/auth_hive_model.dart';


class AuthLocalDataSource implements IAuthDataSource{
  final HiveService _hiveService;
  AuthLocalDataSource(this._hiveService);

  @override
  Future<void> createStudent(StudentEntity studentEntity) async {
    try {
      final authHiveModel = AuthHiveModel.fromEntity(studentEntity);
      await _hiveService.addStudent(authHiveModel);
    }catch(e){
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteStudent(id) async{
    try{
      return await _hiveService.deleteStudent(id);

    }catch(e){
      throw Exception(e);
    }

  }



  @override
  Future<List<StudentEntity>> getAllStudents() {
    // TODO: implement getAllCourses
    throw UnimplementedError();
  }

// @override
// Future<List<BatchEntity>> getAllBatches() {
//   try{
//     return _hiveService.getAllBatches().then((value){
//       return value.map((e) => e.toEntity()).toList();
//
//     });
//         } catch(e){
//     throw Exception(e);
//   }
// }

}