import 'package:balancer/box/budget/budget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'budget_interface.dart';

class BudgetRepository implements BudgetInterface {
  var boxInitName = 'Budget_box';

  BudgetRepository() {
    initHive();
  }

  Future<void> initHive() async {
    await Hive.initFlutter();
    debugPrint('Hive initialized to Budget');

    if (!Hive.isAdapterRegistered(BudgetAdapter().typeId)) {
      Hive.registerAdapter(BudgetAdapter());
      debugPrint('Hive adapter Budget registered');
    }

    await Hive.openBox<Budget>(boxInitName);
    debugPrint('Hive box Budget opened');
  }

  @override
  Future<void> initBox() async {
    if (!Hive.isBoxOpen(boxInitName)) {
      await Hive.openBox<Budget>(boxInitName);
    }
  }

  @override
  Future<void> boxAdd(
      int amountBudget, int? spent, int? left, int? expenses) async {
    var box = Hive.box<Budget>(boxInitName);
    Budget? lastBudget = box.isNotEmpty ? box.getAt(box.length - 1) : null;
    int updatedAmountBudget = amountBudget + (lastBudget?.amountBudget ?? 0);

    box.add(Budget(
      amountBudget: updatedAmountBudget,
      spent: spent,
      left: left,
      expenses: expenses,
    ));
  }

  @override
  Future<void> removeAllBox() async {
    var box = Hive.box<Budget>(boxInitName);
    await box.clear();
  }

  @override
  Future<void> removeBox(int index) async {
    var box = Hive.box<Budget>(boxInitName);
    box.deleteAt(index);
  }

  @override
  Future<void> replaceSpentToBox(int newSpent) async {
    var box = Hive.box<Budget>(boxInitName);
    var budgets = box.values.toList();

    if (budgets.isNotEmpty) {
      var lastBudget = budgets.last; // получаем последний элемент

      var updatedSpent = (lastBudget.spent ?? 0) + newSpent;
      var updatedAmountBudget = (lastBudget.amountBudget) - newSpent;

      updatedSpent = updatedSpent < 0 ? 0 : updatedSpent;
      updatedAmountBudget = updatedAmountBudget < 0 ? 0 : updatedAmountBudget;

      box.putAt(
        budgets.length - 1, // обновляем последний элемент
        Budget(
          amountBudget: updatedAmountBudget,
          spent: updatedSpent,
          left: lastBudget.left, // left остается неизменным
          expenses: lastBudget.expenses,
        ),
      );
    }
  }

  @override
  Future<void> replaceBudgetValues({
    int? newAmountBudget,
    int? newSpent,
    int? newLeft,
    int? newExpenses,
  }) async {
    var box = Hive.box<Budget>(boxInitName);
    var budgets = box.values.toList();

    if (budgets.isNotEmpty) {
      var lastBudget = budgets.last; // получаем последний элемент

      newSpent = ((newSpent ?? lastBudget.spent)! < 0) ? 0 : newSpent;
      newAmountBudget = ((newAmountBudget ?? lastBudget.amountBudget) < 0)
          ? 0
          : newAmountBudget;

      box.putAt(
        budgets.length - 1, // обновляем последний элемент
        Budget(
          amountBudget: newAmountBudget!,
          spent: newSpent,
          left: lastBudget.left, // left остается неизменным
          expenses: newExpenses ?? lastBudget.expenses,
        ),
      );
    }
  }

  @override
  Future<void> updateLeftAndSpent(int value) async {
    var box = Hive.box<Budget>(boxInitName);
    var budgets = box.values.toList();

    if (budgets.isNotEmpty) {
      var lastBudget = budgets.last; // получаем последний элемент

      var updatedAmountBudget = (lastBudget.amountBudget) + value;
      var updatedSpent = (lastBudget.spent ?? 0) - value;

      updatedAmountBudget = updatedAmountBudget < 0 ? 0 : updatedAmountBudget;
      updatedSpent = updatedSpent < 0 ? 0 : updatedSpent;

      box.putAt(
        budgets.length - 1, // обновляем последний элемент
        Budget(
          amountBudget: updatedAmountBudget,
          spent: updatedSpent,
          left: lastBudget.left, // left остается неизменным
          expenses: lastBudget.expenses,
        ),
      );
    }
  }

  @override
  Future<List<Budget>> getAllBudgets() async {
    var box = Hive.box<Budget>(boxInitName);
    return box.values.toList();
  }
}
