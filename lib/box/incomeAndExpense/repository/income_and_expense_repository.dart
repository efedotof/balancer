import 'package:balancer/box/incomeAndExpense/expense/expense_model.dart';
import 'package:balancer/box/incomeAndExpense/income/income_model.dart';
import 'package:balancer/box/models/transactions.dart';
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
    debugPrint('Hive box Income and Expense opened');
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
    required String? subtitle,
    required List<int>? iconD
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
      subtitle: subtitle,
      time: time,
      amountExpense: amountExpense,
      amounts: amounts,
      names: names,
      dates: dates,
      iconD: iconD,
    ));
  }

  @override
  Future boxAddIncome({
    required DateTime time,
    required int amountIncome,
    required List<Transactions> transIncome,
    required String? subtitle,
    required List<int>? iconD
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
      subtitle: subtitle,
      time: time,
      amountIncome: amountIncome,
      amounts: amounts,
      names: names,
      dates: dates,
      iconD: iconD,
    ));
  }

@override
Future<Map<String, int>> getIncomeStats() async {
  var box = Hive.box<Income>(boxInitName);
  Map<String, int> categorySums = {};

  for (var income in box.values) {
    for (int i = 0; i < income.names.length; i++) {
      var name = income.names[i];
      var amount = income.amounts[i];

      // Если name уже есть в categorySums, прибавляем amount
      if (categorySums.containsKey(name)) {
        categorySums[name] = categorySums[name]! + amount;
      } else {
        // Если name нет, создаем новую запись
        categorySums[name] = amount;
      }
    }
  }

  debugPrint("incomeStats: $categorySums");
  return categorySums;
}

@override
Future<Map<String, int>> getExpenseStats() async {
  var box = Hive.box<Expense>(boxInitNameExpense);
  Map<String, int> categorySums = {};

  for (var expense in box.values) {
    for (int i = 0; i < expense.names.length; i++) {
      var name = expense.names[i];
      var amount = expense.amounts[i];

      // Если name уже есть в categorySums, прибавляем amount
      if (categorySums.containsKey(name)) {
        categorySums[name] = categorySums[name]! + amount;
      } else {
        // Если name нет, создаем новую запись
        categorySums[name] = amount;
      }
    }
  }

  debugPrint("expenseStats: $categorySums");
  return categorySums;
}


}
