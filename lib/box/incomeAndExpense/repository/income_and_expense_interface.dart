import 'package:balancer/box/models/transactions.dart';
import 'package:balancer/features/new_transaction/widget/category.dart';

abstract interface class IncomeAndExpenseInterface {
  Future initBox() async {}

  Future boxAddIncome({required DateTime time, required int amountIncome, required List<Transactions> transIncome}) async {}
  Future boxAddExpense({required DateTime time, required int amountExpense, required List<Transactions> transExpense}) async {}

  Future removeBox(int index) async {}

  Future removeAllBox() async {}
  Future<Map<TransactionCategoryTitle, int>> getExpenseStats();
  Future<Map<TransactionCategoryTitle, int>> getIncomeStats();
}