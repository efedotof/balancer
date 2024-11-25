
import 'package:balancer/box/goals/goals.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'goals_interface.dart';

class GoalsRepository implements GoalsInterface {
 var boxInitName = 'goals_box';

  GoalsRepository() {
    initHive();
  }
  Future<void> initHive() async {
   await Hive.initFlutter();
    debugPrint('Hive initialized', );

    if (!Hive.isAdapterRegistered(GoalsAdapter().typeId)) {
      Hive.registerAdapter(GoalsAdapter());
      debugPrint('Hive registrationAdapter');
    }

    await Hive.openBox<Goals>(boxInitName);
    debugPrint('Hive opened', );
  }

  @override
  Future<void> initBox() async {
    if (!Hive.isBoxOpen(boxInitName)) {
      await Hive.openBox<Goals>(boxInitName);
    }
  }

  @override
  Future<void> boxAdd(String title, int goalsAmount) async {
    var box = Hive.box<Goals>(boxInitName);
    box.add(Goals(nameGoals: title, goalsAmount: goalsAmount, goalsFilled: 0, percentageOfTheBudget: 0, transactionts: [], spentAmount: 0));
  }

  @override
  Future<void> removeAllBox() async {
    var box = Hive.box<Goals>(boxInitName);
    await box.clear();
  }

  @override
  Future<void> removeBox(int index) async {
    var box = Hive.box<Goals>(boxInitName);
    box.deleteAt(index);
  }
 }