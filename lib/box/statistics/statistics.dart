
import 'package:hive_flutter/hive_flutter.dart';

part 'statistics.g.dart';



@HiveType(typeId: 0)
class Statistics extends HiveObject {

  @HiveField(0)
  double amountExpenses;

  @HiveField(1)
  double amountIncome;


  Statistics({
    required this.amountExpenses,
    required this.amountIncome,
  });






}