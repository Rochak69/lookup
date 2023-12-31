// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_video_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FeedVideoModelAdapter extends TypeAdapter<FeedVideoModel> {
  @override
  final int typeId = 0;

  @override
  FeedVideoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FeedVideoModel(
      feedId: fields[0] as int?,
      like: fields[1] as int?,
      share: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, FeedVideoModel obj) {
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
      other is FeedVideoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
