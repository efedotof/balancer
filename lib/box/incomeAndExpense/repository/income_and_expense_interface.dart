import 'package:balancer/box/models/transactions.dart';


abstract interface class IncomeAndExpenseInterface {
  Future initBox() async {}

  Future boxAddIncome({required DateTime time, required double amountIncome, required List<Transactions> transIncome, required String? subtitle, required List<int>? iconD, List<String>? arbDate,}) async {}
  Future boxAddExpense({required DateTime time, required double amountExpense, required List<Transactions> transExpense, required String? subtitle, required List<int>? iconD, List<String>? arbDate,}) async {}

  Future removeBox(int index) async {}

  Future removeAllBox() async {}
  Future<Map<String, double>> getExpenseStats();
  Future<Map<String, double>> getIncomeStats();
}