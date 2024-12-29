import 'package:hive_flutter/hive_flutter.dart';

part 'goals.g.dart';

@HiveType(typeId: 3)
class Goals extends HiveObject {

  @HiveField(0)
  final String nameGoals;

  @HiveField(1)
  final double goalsAmount;

  @HiveField(2)
  final double spentAmount;

  @HiveField(3)
  final double goalsFilled;

  @HiveField(4)
  final double? percentageOfTheBudget;


  @HiveField(5)
  final List<double> amounts;  

  @HiveField(6)
  final List<String> namesTrans;  

  @HiveField(7)
  final List<DateTime> dates; 
  


  @HiveField(8)
  final int iconCode;
  
  @HiveField(9)
  final List<String>? arbDateNameTrans;
  
  @HiveField(10)
  final List<bool>? incomeOrExpenses;


  Goals({
    required this.nameGoals,
    required this.goalsAmount,
    required this.spentAmount,
    required this.goalsFilled,
    required this.percentageOfTheBudget,
    required this.amounts,
    required this.namesTrans,
    required this.dates,
    required this.iconCode,
    this.arbDateNameTrans,
    this.incomeOrExpenses,
  });

}
