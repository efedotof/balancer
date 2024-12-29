// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatisticsAdapter extends TypeAdapter<Statistics> {
  @override
  final int typeId = 0;

  @override
  Statistics read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Statistics(
      amountExpenses: fields[0] as double,
      amountIncome: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Statistics obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.amountExpenses)
      ..writeByte(1)
      ..write(obj.amountIncome);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatisticsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
