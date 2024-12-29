import 'package:balancer/box/goals/goals.dart';
import 'package:balancer/features/new_transaction/widget/category.dart';

abstract interface class GoalsInterface {
  Future initBox() async {}

  Future<void> boxAdd(
    String title,
    double goalsAmount,
    double? goalsFilled,
    double? percentageOfBudget,
    List<double>? amounts,
    List<String>? namesTrans,
    List<DateTime>? dates,
    double? spentAmount,
    int inCode,
  );

  Future<void> removeBox(Goals goal);

  Future removeAllBox() async {}

  Future<void> addTransactionToGoal({
    required Goals goal,
    required List<double> amounts,
    required List<String> namesTrans,
    required List<DateTime> dates,
    List<String>? arbDateTransName,
    required TransactionCategory category,
    List<bool>? incomeOrExpenses,
  });

  Future<void> updateGoalName(Goals goal, String newName);
  Future<void> updateGoalAmount(Goals goal, double newAmount);
  Future<void> updateGoalAmountAndName(Goals goal, double newAmount, String name);
  Future<void> updatePercentageOfTheBudget(Goals goal, double newPercentage);
  Future<List<Goals>> getGoalsWithPercentageOfTheBudget();

  Future<void> removeTransactionFromGoal({
    required Goals goal,
    required int index,
  });
}
