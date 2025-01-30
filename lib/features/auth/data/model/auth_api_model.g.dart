// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthApiModel _$AuthApiModelFromJson(Map<String, dynamic> json) => AuthApiModel(
      userId: json['userId'] as String?,
      fullname: json['fullname'] as String,
      address: json['address'] as String,
      phonenumber: json['phonenumber'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$AuthApiModelToJson(AuthApiModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'fullname': instance.fullname,
      'address': instance.address,
      'phonenumber': instance.phonenumber,
      'email': instance.email,
      'password': instance.password,
    };
