
import 'package:hive_flutter/hive_flutter.dart';

part 'statistics.g.dart';



@HiveType(typeId: 3)
class Statistics extends HiveObject {

  @HiveField(0)
  int amountExpenses;

  @HiveField(1)
  int amountIncome;


  Statistics({
    required this.amountExpenses,
    required this.amountIncome,
  });






}