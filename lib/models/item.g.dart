// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemAdapter extends TypeAdapter<Item> {
  @override
  final int typeId = 2;

  @override
  Item read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Item(
      supplierItem: fields[0] as String,
      productName: fields[2] as String,
      unitPrice: fields[3] as double,
      lotQuantity: fields[6] as int,
      uom: fields[7] as String,
      itemType: fields[5] as String?,
      itemFormat: fields[4] as String?,
    )..productId = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, Item obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.supplierItem)
      ..writeByte(1)
      ..write(obj.productId)
      ..writeByte(2)
      ..write(obj.productName)
      ..writeByte(3)
      ..write(obj.unitPrice)
      ..writeByte(4)
      ..write(obj.itemFormat)
      ..writeByte(5)
      ..write(obj.itemType)
      ..writeByte(6)
      ..write(obj.lotQuantity)
      ..writeByte(7)
      ..write(obj.uom);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
