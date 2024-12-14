import 'package:balancer/box/models/transactions.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'goals.g.dart';

@HiveType(typeId: 1)
class Goals extends HiveObject {

  @HiveField(0)
  final String nameGoals;

  @HiveField(1)
  final int goalsAmount;

  @HiveField(2)
  final int spentAmount;

  @HiveField(3)
  final int goalsFilled;

  @HiveField(4)
  final int percentageOfTheBudget;

  @HiveField(5)
  final List<Transactions> transactionts;

  @HiveField(6)
  final int iconCode;

  Goals({
    required this.nameGoals,
    required this.goalsAmount,
    required this.spentAmount,
    required this.goalsFilled,
    required this.percentageOfTheBudget,
    required this.transactionts,
    required this.iconCode
  });



  // Goals({
  // });


}