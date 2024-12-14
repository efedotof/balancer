// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IncomeAdapter extends TypeAdapter<Income> {
  @override
  final int typeId = 4;

  @override
  Income read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Income(
      time: fields[0] as DateTime,
      amountIncome: fields[1] as int,
      amounts: (fields[2] as List).cast<int>(),
      names: (fields[3] as List).cast<String>(),
      dates: (fields[4] as List).cast<DateTime>(),
    );
  }

  @override
  void write(BinaryWriter writer, Income obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.time)
      ..writeByte(1)
      ..write(obj.amountIncome)
      ..writeByte(2)
      ..write(obj.amounts)
      ..writeByte(3)
      ..write(obj.names)
      ..writeByte(4)
      ..write(obj.dates);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IncomeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
