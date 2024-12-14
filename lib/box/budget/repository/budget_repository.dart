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
    debugPrint('Hive initialized');

    if (!Hive.isAdapterRegistered(BudgetAdapter().typeId)) {
      Hive.registerAdapter(BudgetAdapter());
      debugPrint('Hive adapter registered');
    }

    await Hive.openBox<Budget>(boxInitName);
    debugPrint('Hive box opened');
  }

  @override
  Future<void> initBox() async {
    if (!Hive.isBoxOpen(boxInitName)) {
      await Hive.openBox<Budget>(boxInitName);
    }
  }

  @override
  Future<void> boxAdd(int amountBudget, int? spent, int? left, int? expenses) async {
    var box = Hive.box<Budget>(boxInitName);
    box.add(Budget(amountBudget: amountBudget, spent: spent, left: left, expenses: expenses));
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
  Future<void> replaceSpentToBox(int index, int newSpent) async {
    var box = Hive.box<Budget>(boxInitName);
    var budget = box.getAt(index);

    if (budget != null) {
      var updatedSpent = (budget.spent ?? 0) + newSpent;
      var updatedLeft = (budget.left ?? 0) - newSpent;

      // Условие для проверки, если значения меньше 0
      updatedSpent = updatedSpent < 0 ? 0 : updatedSpent;
      updatedLeft = updatedLeft < 0 ? 0 : updatedLeft;

      box.putAt(
        index,
        Budget(
          amountBudget: budget.amountBudget,
          spent: updatedSpent,
          left: updatedLeft,
          expenses: budget.expenses,
        ),
      );
    }
  }

  @override
  Future<void> replaceBudgetValues(
    int index, {
    int? newAmountBudget,
    int? newSpent,
    int? newLeft,
    int? newExpenses,
  }) async {
    var box = Hive.box<Budget>(boxInitName);
    var budget = box.getAt(index);

    if (budget != null) {
      // Проверка на минимальные значения для spent и left
      newSpent = ((newSpent ?? budget.spent)! < 0) ? 0 : newSpent;
      newLeft = ((newLeft ?? budget.left)! < 0)? 0 : newLeft;

      box.putAt(
        index,
        Budget(
          amountBudget: newAmountBudget ?? budget.amountBudget,
          spent: newSpent,
          left: newLeft,
          expenses: newExpenses ?? budget.expenses,
        ),
      );
    }
  }

  @override
  Future<List<Budget>> getAllBudgets() async {
    var box = Hive.box<Budget>(boxInitName);
    return box.values.toList();
  }
  
  @override
  Future<void> updateLeftAndSpent(int index, int value) async {
    var box = Hive.box<Budget>(boxInitName);
    var budget = box.getAt(index);

    if (budget != null) {
      var updatedLeft = (budget.left ?? 0) + value;
      var updatedSpent = (budget.spent ?? 0) - value;

      // Условие для проверки, если значения меньше 0
      updatedLeft = updatedLeft < 0 ? 0 : updatedLeft;
      updatedSpent = updatedSpent < 0 ? 0 : updatedSpent;

      box.putAt(
        index,
        Budget(
          amountBudget: budget.amountBudget,
          spent: updatedSpent,
          left: updatedLeft,
          expenses: budget.expenses,
        ),
      );
    }
  }
}
