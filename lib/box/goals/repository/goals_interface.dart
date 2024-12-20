import 'package:balancer/box/goals/goals.dart';
import 'package:balancer/features/new_transaction/widget/category.dart';

abstract interface class GoalsInterface {
  Future initBox() async {}

 Future<void> boxAdd(
    String title,
    int goalsAmount,
    int? goalsFilled,
    int? percentageOfBudget,
    List<int>? amounts,
    List<String>? namesTrans,
    List<DateTime>? dates,
    int? spentAmount,
    int inCode,
  );

  Future removeBox(int index) async {}

  Future removeAllBox() async {}
  
 Future<void> addTransactionToGoal(
    Goals goal,
    List<int> amounts,
    List<String> namesTrans,
    List<DateTime> dates,
    TransactionCategory category,
  );

  Future<void> updateGoalName(Goals goal, String newName);
  Future<void> updateGoalAmount(Goals goal, int newAmount);
  Future<void> updateGoalAmountAndName(Goals goal, int newAmount, String name);
}
