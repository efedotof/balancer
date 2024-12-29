// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goals.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GoalsAdapter extends TypeAdapter<Goals> {
  @override
  final int typeId = 3;

  @override
  Goals read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Goals(
      nameGoals: fields[0] as String,
      goalsAmount: fields[1] as double,
      spentAmount: fields[2] as double,
      goalsFilled: fields[3] as double,
      percentageOfTheBudget: fields[4] as double?,
      amounts: (fields[5] as List).cast<double>(),
      namesTrans: (fields[6] as List).cast<String>(),
      dates: (fields[7] as List).cast<DateTime>(),
      iconCode: fields[8] as int,
      arbDateNameTrans: (fields[9] as List?)?.cast<String>(),
      incomeOrExpenses: (fields[10] as List?)?.cast<bool>(),
    );
  }

  @override
  void write(BinaryWriter writer, Goals obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.nameGoals)
      ..writeByte(1)
      ..write(obj.goalsAmount)
      ..writeByte(2)
      ..write(obj.spentAmount)
      ..writeByte(3)
      ..write(obj.goalsFilled)
      ..writeByte(4)
      ..write(obj.percentageOfTheBudget)
      ..writeByte(5)
      ..write(obj.amounts)
      ..writeByte(6)
      ..write(obj.namesTrans)
      ..writeByte(7)
      ..write(obj.dates)
      ..writeByte(8)
      ..write(obj.iconCode)
      ..writeByte(9)
      ..write(obj.arbDateNameTrans)
      ..writeByte(10)
      ..write(obj.incomeOrExpenses);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GoalsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
