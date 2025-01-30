import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:realestateapplication/app/constants/hive_table_constant.dart';
import 'package:realestateapplication/features/auth/domain/entity/auth_entity.dart';
import 'package:uuid/uuid.dart';

part 'auth_hive_model.g.dart';
@HiveType(typeId: HiveTableConstant.userTableId)
class AuthHiveModel extends Equatable {
  @HiveField(0)
  final String? userId;
  @HiveField(1)
  final String fullname;
  @HiveField(3)
  final String address;
  @HiveField(4)
  final String phonenumber;
  @HiveField(5)
  final String email;
  @HiveField(6)
  final String password;

  AuthHiveModel({
    String? userId,
    required this.fullname,
    required this.address,
    required this.phonenumber,
    required this.email,
    required this.password,
  }) : userId = userId ?? const Uuid().v4();

  // Initial Constructor
  const AuthHiveModel.initial()
      : userId = '',
        fullname = '',
        address = '',
        phonenumber = '',
        email = '',
        password = '';

  // From Entity
  factory AuthHiveModel.fromEntity(AuthEntity entity) {
    return AuthHiveModel(
      userId: entity.userId,
      fullname: entity.fullname,
      address: entity.address,
      phonenumber: entity.phonenumber,
      email: entity.email,
      password: entity.password,
    );
  }

  // To Entity
  AuthEntity toEntity() {
    return AuthEntity(
      fullname: fullname,
      address: address,
      phonenumber: phonenumber,
      email: email,
      password: password,
    );
  }

  @override
  List<Object?> get props =>
      [userId, fullname, address, phonenumber, email, password];
}
