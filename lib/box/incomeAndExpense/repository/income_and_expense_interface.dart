import 'package:balancer/box/models/transactions.dart';

abstract interface class IncomeAndExpenseInterface {
  Future initBox() async {}

  Future boxAddIncome({required DateTime time, required int amountIncome, required List<Transactions> transIncome, required String? subtitle, required List<int>? iconD}) async {}
  Future boxAddExpense({required DateTime time, required int amountExpense, required List<Transactions> transExpense, required String? subtitle, required List<int>? iconD}) async {}

  Future removeBox(int index) async {}

  Future removeAllBox() async {}
  Future<Map<String, int>> getExpenseStats();
  Future<Map<String, int>> getIncomeStats();
}