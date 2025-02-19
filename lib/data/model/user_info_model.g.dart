// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserInfoModelAdapter extends TypeAdapter<UserInfoModel> {
  @override
  final int typeId = 0;

  @override
  UserInfoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserInfoModel(
      course_taken: fields[1] as String,
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserInfoModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.course_taken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserInfoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
