import 'package:hive_flutter/hive_flutter.dart';

part 'income_model.g.dart';

@HiveType(typeId: 1)
class Income extends HiveObject {
  @HiveField(0)
  DateTime time;

  @HiveField(1)
  double amountIncome;

  @HiveField(2)
  List<double> amounts;

  @HiveField(3)
  List<String> names;

  @HiveField(4)
  List<DateTime> dates;

  @HiveField(5)
  String? subtitle;

  @HiveField(6)
  List<int>? iconD;

  @HiveField(7)
  final List<String>? arbDate;



  Income(
  {
    this.subtitle,
    required this.time,
    required this.amountIncome,
    required this.amounts,
    required this.names,
    required this.dates,
    this.iconD,
    this.arbDate,
  });
}
