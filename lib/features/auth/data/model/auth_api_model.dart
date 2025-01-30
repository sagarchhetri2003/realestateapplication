import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:realestateapplication/features/auth/domain/entity/auth_entity.dart';

part 'auth_api_model.g.dart';
@JsonSerializable()
class AuthApiModel extends Equatable {
  @JsonKey(name: 'userId')
  final String? userId;
  final String fullname;
  final String address;
  final String phonenumber;
  final String email;
  final String password;

  const AuthApiModel({
    this.userId,
    required this.fullname,
    required this.address,
    required this.phonenumber,
    required this.email,
    required this.password,
  });

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  factory AuthApiModel.fromEntity(AuthEntity entity) => AuthApiModel(
        userId: entity.userId,
        email: entity.email,
        fullname: entity.fullname,
        password: entity.password,
        phonenumber: entity.phonenumber,
        address: entity.address,
      );
  AuthEntity toEntity() => AuthEntity(
      userId: userId,
      email: email,
      fullname: fullname,
      password: password,
      address: address,
      phonenumber: phonenumber);

  @override
  List<Object?> get props =>
      [userId, fullname, address, password, phonenumber, email];
}
