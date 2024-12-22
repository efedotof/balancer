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
  final int? percentageOfTheBudget;


  @HiveField(5)
  final List<int> amounts;  

  @HiveField(6)
  final List<String> namesTrans;  

  @HiveField(7)
  final List<DateTime> dates; 

  @HiveField(8)
  final int iconCode;

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
  });

}
