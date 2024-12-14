import 'package:balancer/box/incomeAndExpense/expense/expense_model.dart';
import 'package:balancer/box/incomeAndExpense/income/income_model.dart';
import 'package:balancer/box/models/transactions.dart';
import 'package:balancer/features/new_transaction/widget/category.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'income_and_expense_interface.dart';

class IncomeAndExpenseRepository implements IncomeAndExpenseInterface {
  var boxInitName = 'IncomeModel_box';
  var boxInitNameExpense = 'ExpenseModel_box';

  IncomeAndExpenseRepository() {
    initHive();
  }

  Future<void> initHive() async {
    await Hive.initFlutter();
    debugPrint('Hive initialized');

    if (!Hive.isAdapterRegistered(IncomeAdapter().typeId) &&
        !Hive.isAdapterRegistered(ExpenseAdapter().typeId)) {
      Hive.registerAdapter(IncomeAdapter());
      Hive.registerAdapter(ExpenseAdapter());
      debugPrint('Hive adapter registered: IncomeAdapter');
      debugPrint('Hive adapter registered: ExpenseAdapter');
    }

    await Hive.openBox<Income>(boxInitName);
    await Hive.openBox<Expense>(boxInitNameExpense);
    debugPrint('Hive box opened');
  }

  @override
  Future<void> initBox() async {
    if (!Hive.isBoxOpen(boxInitName) && !Hive.isBoxOpen(boxInitNameExpense)) {
      await Hive.openBox<Income>(boxInitName);
      await Hive.openBox<Expense>(boxInitNameExpense);
    }
  }

  @override
  Future<void> removeAllBox() async {
    var expense = Hive.box<Expense>(boxInitNameExpense);
    await expense.clear();
    var income = Hive.box<Income>(boxInitName);
    await income.clear();
  }

  @override
  Future<void> removeBox(int index) async {
    var income = Hive.box<Income>(boxInitName);
    income.deleteAt(index);
    var expense = Hive.box<Expense>(boxInitNameExpense);
    expense.deleteAt(index);
  }

 @override
Future boxAddExpense({
  required DateTime time,
  required int amountExpense,
  required List<Transactions> transExpense,
}) async {
  var box = Hive.box<Expense>(boxInitNameExpense);
  debugPrint('transExpense ^ $transExpense');

  List<int> amounts = [];
  List<String> names = [];
  List<DateTime> dates = [];

  for (var trans in transExpense) {
    amounts.add(trans.amount);
    names.add(trans.nameTrans);
    dates.add(trans.date); 
  }


  box.add(Expense(
    time: time,
    amountExpense: amountExpense,
    amounts: amounts,
    names: names,
    dates: dates,
  ));
}

  @override
Future boxAddIncome({
  required DateTime time,
  required int amountIncome,
  required List<Transactions> transIncome,
}) async {
  var box = Hive.box<Income>(boxInitName);
  debugPrint('transIncome ^ $transIncome');

  List<int> amounts = [];
  List<String> names = [];
  List<DateTime> dates = [];

  for (var trans in transIncome) {
    amounts.add(trans.amount);
    names.add(trans.nameTrans); 
    dates.add(trans.date); 
  }


  box.add(Income(
    time: time,
    amountIncome: amountIncome,
    amounts: amounts,
    names: names,
    dates: dates,
  ));
}

 @override
Future<Map<TransactionCategoryTitle, int>> getIncomeStats() async {
  var box = Hive.box<Income>(boxInitName);
  Map<TransactionCategoryTitle, int> categorySums = {};


  for (var income in box.values) {
    for (int i = 0; i < income.amounts.length; i++) {
      var category = TransactionCategoryTitle.values[i];
      var amount = income.amounts[i];


      if (categorySums.containsKey(category)) {
        categorySums[category] = categorySums[category]! + amount;
      } else {
        categorySums[category] = amount;
      }
    }
  }


  int totalIncome = categorySums.values.fold(0, (sum, amount) => sum + amount);
  categorySums[TransactionCategoryTitle.otherIncome] = totalIncome; 

  return categorySums;
}

 @override
Future<Map<TransactionCategoryTitle, int>> getExpenseStats() async {
  var box = Hive.box<Expense>(boxInitNameExpense);
  Map<TransactionCategoryTitle, int> categorySums = {};


  for (var expense in box.values) {
    for (int i = 0; i < expense.amounts.length; i++) {
      var category = TransactionCategoryTitle.values[i + TransactionCategoryTitle.values.length ~/ 2]; 
      var amount = expense.amounts[i];

      if (categorySums.containsKey(category)) {
        categorySums[category] = categorySums[category]! + amount;
      } else {
        categorySums[category] = amount;
      }
    }
  }


  int totalExpense = categorySums.values.fold(0, (sum, amount) => sum + amount);
  categorySums[TransactionCategoryTitle.otherExpense] = totalExpense; 

  return categorySums;
}



}
