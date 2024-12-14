import 'package:balancer/box/models/transactions.dart';

abstract interface class GoalsInterface {
  Future initBox() async {}

  Future boxAdd(String title, int goalsAmount, int? goalsFilled, int? percentageOfBudget, List<Transactions>? transactions, int? spentAmount, int inCode) async {}

  Future removeBox(int index) async {}

  Future removeAllBox() async {}
}
