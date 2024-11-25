

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
    debugPrint('Hive initialized', );

    if (!Hive.isAdapterRegistered(BudgetAdapter().typeId)) {
      Hive.registerAdapter(BudgetAdapter());
      debugPrint('Hive registrationAdapter');
    }

    await Hive.openBox<Budget>(boxInitName);
    debugPrint('Hive opened', );
  }

  @override
  Future<void> initBox() async {
    if (!Hive.isBoxOpen(boxInitName)) {
      await Hive.openBox<Budget>(boxInitName);
    }
  }

  @override
  Future<void> boxAdd(int amountBudget, int? spent, int? left) async {
    var box = Hive.box<Budget>(boxInitName);
    box.add(Budget(amountBudget: amountBudget, spent: spent, left: left));
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
}