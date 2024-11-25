import 'package:balancer/box/models/transactions.dart';

abstract interface class StatisticsInterface {
   Future initBox() async {}

  Future boxAdd(int amountExpenses, int amountIncome, List<Transactions>transExpense, List<Transactions> transIncome) async {}

  Future removeBox(int index) async {}

  Future removeAllBox() async {}
}