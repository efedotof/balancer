import 'package:hive_flutter/hive_flutter.dart';

part 'budget.g.dart';



@HiveType(typeId: 2)
class Budget extends HiveObject {

  @HiveField(0)
  int amountBudget;

  @HiveField(1)
  int? spent;

  @HiveField(2)
  int? left;

  Budget({
    required this.amountBudget,
    required this.spent,
    required this.left
  });






}