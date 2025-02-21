import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:realestateapplication/features/auth/domain/entity/auth_entity.dart';

part 'auth_api_model.g.dart';

@JsonSerializable()
class AuthApiModel extends Equatable {
  @JsonKey(name: 'userId')
  final String? userId;
  final String fullName;
  final String address;
  final String phonenumber;
  final String email;
  final String password;
  final String? image;

  const AuthApiModel({
    this.userId,
    required this.fullName,
    required this.address,
    required this.phonenumber,
    required this.email,
    required this.password,
    this.image,
  });

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  factory AuthApiModel.fromEntity(AuthEntity entity) => AuthApiModel(
        userId: entity.userId,
        email: entity.email,
        fullName: entity.fullName,
        password: entity.password,
        phonenumber: entity.phonenumber,
        address: entity.address,
        image: entity.image,
      );
  AuthEntity toEntity() => AuthEntity(
        userId: userId,
        email: email,
        fullName: fullName,
        password: password,
        address: address,
        phonenumber: phonenumber,
        image: image,
      );

  @override
  List<Object?> get props =>
      [userId, fullName, address, password, phonenumber, email, image];
}
