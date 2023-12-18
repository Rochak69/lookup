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

class LikeShareCountAdapter extends TypeAdapter<LikeShareCount> {
  @override
  final int typeId = 0;

  @override
  LikeShareCount read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LikeShareCount(
      feedId: fields[0] as int,
      like: fields[1] as int?,
      share: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, LikeShareCount obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.feedId)
      ..writeByte(1)
      ..write(obj.like)
      ..writeByte(2)
      ..write(obj.share);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LikeShareCountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
