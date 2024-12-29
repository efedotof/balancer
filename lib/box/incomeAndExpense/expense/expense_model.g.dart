// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpenseAdapter extends TypeAdapter<Expense> {
  @override
  final int typeId = 2;

  @override
  Expense read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Expense(
      subtitle: fields[5] as String?,
      time: fields[0] as DateTime,
      amountExpense: fields[1] as double,
      amounts: (fields[2] as List).cast<double>(),
      names: (fields[3] as List).cast<String>(),
      dates: (fields[4] as List).cast<DateTime>(),
      iconD: (fields[6] as List?)?.cast<int>(),
      arbDate: (fields[7] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Expense obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.time)
      ..writeByte(1)
      ..write(obj.amountExpense)
      ..writeByte(2)
      ..write(obj.amounts)
      ..writeByte(3)
      ..write(obj.names)
      ..writeByte(4)
      ..write(obj.dates)
      ..writeByte(5)
      ..write(obj.subtitle)
      ..writeByte(6)
      ..write(obj.iconD)
      ..writeByte(7)
      ..write(obj.arbDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpenseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
