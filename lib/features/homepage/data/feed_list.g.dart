// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FeedModelAdapter extends TypeAdapter<FeedModel> {
  @override
  final int typeId = 0;

  @override
  FeedModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FeedModel(
      fields[0] as int,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FeedModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeedModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
