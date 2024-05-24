// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stockItem.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StockItemAdapter extends TypeAdapter<StockItem> {
  @override
  final int typeId = 5;

  @override
  StockItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StockItem(
      itemFormat: fields[2] as String,
      itemType: fields[0] as String,
      quantity: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, StockItem obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.itemType)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(2)
      ..write(obj.itemFormat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StockItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
