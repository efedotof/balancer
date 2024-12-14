// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goals.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GoalsAdapter extends TypeAdapter<Goals> {
  @override
  final int typeId = 1;

  @override
  Goals read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Goals(
      nameGoals: fields[0] as String,
      goalsAmount: fields[1] as int,
      spentAmount: fields[2] as int,
      goalsFilled: fields[3] as int,
      percentageOfTheBudget: fields[4] as int,
      transactionts: (fields[5] as List).cast<Transactions>(),
      iconCode: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Goals obj) {
    writer
      ..writeByte(7)
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
      ..write(obj.transactionts)
      ..writeByte(6)
      ..write(obj.iconCode);
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
