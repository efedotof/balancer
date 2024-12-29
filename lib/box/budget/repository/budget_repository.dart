import 'package:balancer/box/budget/budget.dart';
import 'package:balancer/features/new_transaction/widget/category.dart';
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
      double amountBudget, double spent, double left, double expenses) async {
    var box = Hive.box<Budget>(boxInitName);
    Budget? lastBudget = box.isNotEmpty ? box.getAt(box.length - 1) : null;
    double updatedAmountBudget = amountBudget + (lastBudget?.amountBudget ?? 0);

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
  Future<void> replaceSpentToBox(double newSpent) async {
    var box = Hive.box<Budget>(boxInitName);
    var budgets = box.values.toList();

    if (budgets.isNotEmpty) {
      var lastBudget = budgets.last;

      var updatedSpent = (lastBudget.spent) + newSpent;
      var updatedAmountBudget = (lastBudget.amountBudget) - newSpent;

      updatedSpent = updatedSpent < 0 ? 0 : updatedSpent;
      updatedAmountBudget = updatedAmountBudget < 0 ? 0 : updatedAmountBudget;

      box.putAt(
        budgets.length - 1,
        Budget(
          amountBudget: updatedAmountBudget,
          spent: updatedSpent,
          left: lastBudget.left,
          expenses: lastBudget.expenses,
        ),
      );
    }
  }

  @override
  Future<void> replaceBudgetValues({
    required double amount,
    required TransactionCategory category,
  }) async {
    try {
      var box = Hive.box<Budget>(boxInitName);
      var lastKey = box.keys.last;
      var lastValue = box.get(lastKey);
      if (category == TransactionCategory.income && lastValue != null) {
        final updateAmount = lastValue.amountBudget + amount;
        // final updateLeft = lastValue.left > 0? lastValue.left - amount: 0;
        final updateSpent = lastValue.spent > 0 ? lastValue.spent - amount : 0;
        // debugPrint('lastValue.spent: ${lastValue.spent}');
        box.putAt(
          box.length - 1,
          Budget(
            amountBudget: updateAmount,
            spent: updateSpent.toDouble(),
            left: lastValue.left,
            expenses: lastValue.expenses,
          ),
        );
      } else if (lastValue != null) {
        final updateAmount = lastValue.amountBudget - amount;
        final updateLeft = lastValue.left - amount;
        final updateSpent = lastValue.spent + amount;
        box.putAt(
          box.length - 1,
          Budget(
            amountBudget: updateAmount,
            spent: updateSpent,
            left: updateLeft,
            expenses: lastValue.expenses,
          ),
        );
      }
    } catch (e) {
      debugPrint('error: $e');
    }
  }

  @override
  Future<void> updateLeftAndSpent(double value) async {
    var box = Hive.box<Budget>(boxInitName);
    var lastKey = box.keys.last;
    var lastValue = box.get(lastKey);

    if (lastValue != null) {
      var updatedAmountBudget = (lastValue.amountBudget - 100) + value;
      var updatedSpent = (lastValue.spent) - value;

      updatedAmountBudget = updatedAmountBudget < 0 ? 0 : updatedAmountBudget;
      updatedSpent = updatedSpent < 0 ? 0 : updatedSpent;

      box.putAt(
        box.length - 1,
        Budget(
          amountBudget: updatedAmountBudget,
          spent: updatedSpent,
          left: lastValue.left,
          expenses: lastValue.expenses,
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
