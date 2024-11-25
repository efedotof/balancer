// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatisticsAdapter extends TypeAdapter<Statistics> {
  @override
  final int typeId = 3;

  @override
  Statistics read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Statistics(
      amountExpenses: fields[0] as int,
      amountIncome: fields[1] as int,
      transExpense: (fields[2] as List).cast<Transactions>(),
      transIncome: (fields[3] as List).cast<Transactions>(),
    );
  }

  @override
  void write(BinaryWriter writer, Statistics obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.amountExpenses)
      ..writeByte(1)
      ..write(obj.amountIncome)
      ..writeByte(2)
      ..write(obj.transExpense)
      ..writeByte(3)
      ..write(obj.transIncome);
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
