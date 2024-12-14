import 'package:balancer/box/budget/budget.dart';

abstract interface class BudgetInterface {
  Future initBox() async {}

  Future boxAdd(int amountBudget, int? spent, int? left, int? expenses) async {}

  Future removeBox(int index) async {}

  Future removeAllBox() async {}

  Future<void> replaceBudgetValues(
    int index, {
    int? newAmountBudget,
    int? newSpent,
    int? newLeft,
    int? newExpenses,
  });
  Future<void> replaceSpentToBox(int index, int newSpent);
  Future<List<Budget>> getAllBudgets();
   Future<void> updateLeftAndSpent(int index, int value);
}