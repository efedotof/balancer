import 'package:hive_flutter/hive_flutter.dart';

part 'budget.g.dart';



@HiveType(typeId: 4)
class Budget extends HiveObject {

  @HiveField(0)
  double amountBudget;

  @HiveField(1)
  double spent;

  @HiveField(2)
  double left;

  @HiveField(3)
  double expenses;



  Budget({
    required this.amountBudget,
    required this.spent,
    required this.left,
    required this.expenses,
  });






}