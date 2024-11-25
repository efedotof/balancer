import 'package:balancer/box/models/transactions.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'statistics.g.dart';



@HiveType(typeId: 3)
class Statistics extends HiveObject {

  @HiveField(0)
  int amountExpenses;

  @HiveField(1)
  int amountIncome;

  @HiveField(2)
  List<Transactions> transExpense;

  @HiveField(3)
  List<Transactions> transIncome;

  Statistics({
    required this.amountExpenses,
    required this.amountIncome,
    required this.transExpense,
    required this.transIncome,
  });






}