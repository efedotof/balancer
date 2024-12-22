import 'package:hive_flutter/hive_flutter.dart';

part 'expense_model.g.dart';

@HiveType(typeId: 5)
class Expense extends HiveObject {
  @HiveField(0)
  DateTime time;

  @HiveField(1)
  int amountExpense;

  @HiveField(2)
  List<int> amounts; 

  @HiveField(3)
  List<String> names; 

  @HiveField(4)
  List<DateTime> dates; 

  @HiveField(5)
  String? subtitle;

  @HiveField(6)
  List<int>? iconD;


  Expense({
    this.subtitle,
    required this.time,
    required this.amountExpense,
    required this.amounts,
    required this.names,
    required this.dates,
    this.iconD
  });
}
