import 'package:hive_flutter/hive_flutter.dart';

part 'income_model.g.dart';

@HiveType(typeId: 4)
class Income extends HiveObject {
  @HiveField(0)
  DateTime time;

  @HiveField(1)
  int amountIncome;

  @HiveField(2)
  List<int> amounts;

  @HiveField(3)
  List<String> names;

  @HiveField(4)
  List<DateTime> dates;

  Income({
    required this.time,
    required this.amountIncome,
    required this.amounts,
    required this.names,
    required this.dates,
  });
}
