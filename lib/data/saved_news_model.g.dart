// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_news_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SavedNewsModelAdapter extends TypeAdapter<SavedNewsModel> {
  @override
  final int typeId = 1;

  @override
  SavedNewsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SavedNewsModel(
      title: fields[3] as String?,
      url: fields[0] as String?,
      imageUrl: fields[1] as String?,
      author: fields[4] as String?,
      publishedAt: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SavedNewsModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.publishedAt)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.author);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavedNewsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
