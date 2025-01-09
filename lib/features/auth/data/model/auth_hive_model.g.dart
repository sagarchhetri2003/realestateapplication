// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthHiveModelAdapter extends TypeAdapter<AuthHiveModel> {
  @override
  final int typeId = 0;

  @override
  AuthHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthHiveModel(
      id: fields[0] as String?,
      fname: fields[1] as String,
      lname: fields[2] as String,
      image: fields[3] as String?,
      phone: fields[4] as String,
      username: fields[5] as String,
      password: fields[6] as String,
      batchId: fields[7] as String,
      courseIds: (fields[8] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, AuthHiveModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fname)
      ..writeByte(2)
      ..write(obj.lname)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.username)
      ..writeByte(6)
      ..write(obj.password)
      ..writeByte(7)
      ..write(obj.batchId)
      ..writeByte(8)
      ..write(obj.courseIds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
