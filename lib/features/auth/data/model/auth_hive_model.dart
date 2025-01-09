import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../../app/constants/hive_table_constant.dart';
import '../../../batch/domain/entity/batch_entity.dart';
import '../../../course/domain/entity/course_entity.dart';
import '../../domain/entity/student_entity.dart';

part 'auth_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.studentTableId) // Define a unique typeId
class AuthHiveModel extends Equatable {

  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String fname;

  @HiveField(2)
  final String lname;

  @HiveField(3)
  final String? image;

  @HiveField(4)
  final String phone;

  @HiveField(5)
  final String username;

  @HiveField(6)
  final String password;

  @HiveField(7)
  final String batchId; // Storing only the batch ID for simplicity

  @HiveField(8)
  final List<String> courseIds; // Storing course IDs as a list of strings

  AuthHiveModel({
    String? id,
    required this.fname,
    required this.lname,
    this.image,
    required this.phone,
    required this.username,
    required this.password,
    required this.batchId,
    required this.courseIds,
  }) : id = id ?? const Uuid().v4();

  // Initial Constructor
  const AuthHiveModel.initial()
      : id = '',
        fname = '',
        lname = '',
        image = null,
        phone = '',
        username = '',
        password = '',
        batchId = '',
        courseIds = const [];

  // From Entity
  factory AuthHiveModel.fromEntity(StudentEntity entity) {
    return AuthHiveModel(
      id: entity.id,
      fname: entity.fname,
      lname: entity.lname,
      image: entity.image,
      phone: entity.phone,
      username: entity.username,
      password: entity.password,
      batchId: entity.batch.batchId ?? '', // Extract batch ID
      courseIds: entity.courses.map((course) => course.courseId ?? '').toList(), // Extract course IDs
    );
  }


  // To Entity
  StudentEntity toEntity(BatchEntity batch, List<CourseEntity> courseList) {
    return StudentEntity(
      id: id,
      fname: fname,
      lname: lname,
      image: image,
      phone: phone,
      username: username,
      password: password,
      batch: batch,
      courses: courseList,
    );
  }

  // From Entity List
  static List<AuthHiveModel> fromEntityList(List<StudentEntity> entityList) {
    return entityList.map((entity) => AuthHiveModel.fromEntity(entity)).toList();
  }

  @override
  List<Object?> get props =>
      [id, fname, lname, image, phone, username, password, batchId, courseIds];
}
