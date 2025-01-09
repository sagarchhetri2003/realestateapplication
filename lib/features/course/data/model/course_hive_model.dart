import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:softwarica_student_management_bloc/features/course/domain/entity/course_entity.dart';
import 'package:uuid/uuid.dart';
import '../../../../app/constants/hive_table_constant.dart';
part 'course_hive_model.g.dart';


@HiveType(typeId: HiveTableConstant.courseTableId)

class CourseHiveModel extends Equatable {
  @HiveField(0)
  final String? courseId;

  @HiveField(1)

  final String courseName;

  CourseHiveModel({
    String? courseId,
    required this.courseName,
  }) : courseId = courseId ?? const Uuid().v4();

// Initial Constructor
  const CourseHiveModel.initial()
      : courseId = '',
        courseName= '';

// From Entity
  factory CourseHiveModel.fromEntity(CourseEntity entity) {
    return CourseHiveModel(
      courseId: entity.courseId,
      courseName: entity.courseName,
    );
  }

  static List<CourseHiveModel> fromEntityList(List<CourseEntity> entityList){
    return entityList
        .map((entity)=>CourseHiveModel.fromEntity(entity))
        .toList();
  }
  @override
  List<Object?> get props => [courseId,courseName];
}
