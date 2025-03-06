import 'package:equatable/equatable.dart';
import 'package:food_hub/app/constants/hive_table_constant.dart';
import 'package:food_hub/features/auth/domain/entity/auth_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

part 'auth_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.userTableId)
class AuthHiveModel extends Equatable {
  @HiveField(0)
  final String? userId;
  @HiveField(1)
  final String fName;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String password;
  @HiveField(4)
  final String phone;

  AuthHiveModel({
    String? userId,
    required this.email,
    required this.fName,
    required this.phone,
    required this.password,
  }) : userId = userId ?? const Uuid().v4();

  // Initial Constructor
  const AuthHiveModel.initial()
      : userId = '',
        email = '',
        fName = '',
        phone = '',
        password = '';

  // From Entity
  factory AuthHiveModel.fromEntity(AuthEntity entity) {
    return AuthHiveModel(
      userId: entity.userId,
      email: entity.email,
      fName: entity.name,
      phone: entity.phone,
      password: entity.password,
    );
  }

  // To Entity
  AuthEntity toEntity() {
    return AuthEntity(
      email: email,
      name: fName,
      phone: phone,
      password: password,
    );
  }

  @override
  List<Object?> get props => [email, fName, password, phone];
}
