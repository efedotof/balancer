import 'package:balancer/box/budget/budget.dart';
import 'package:balancer/features/new_transaction/widget/category.dart';

abstract interface class BudgetInterface {
  Future initBox() async {}

  Future boxAdd(
      double amountBudget, double spent, double left, double expenses) async {}

  Future removeBox(int index) async {}

  Future removeAllBox() async {}

  Future<void> replaceBudgetValues({
    required double amount,
    required TransactionCategory category,
  });
  Future<void> replaceSpentToBox(double newSpent);
  Future<List<Budget>> getAllBudgets();
  Future<void> updateLeftAndSpent(double value);
}
