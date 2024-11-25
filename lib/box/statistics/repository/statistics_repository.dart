

import 'package:balancer/box/models/transactions.dart';
import 'package:balancer/box/statistics/statistics.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'statistics_interface.dart';

class StatisticsRepository implements StatisticsInterface {

var boxInitName = 'Statistics_box';

  StatisticsRepository() {
    initHive();
  }
  Future<void> initHive() async {
   await Hive.initFlutter();
    debugPrint('Hive initialized', );

    if (!Hive.isAdapterRegistered(StatisticsAdapter().typeId)) {
      Hive.registerAdapter(StatisticsAdapter());
      debugPrint('Hive registrationAdapter');
    }

    await Hive.openBox<Statistics>(boxInitName);
    debugPrint('Hive opened', );
  }

  @override
  Future<void> initBox() async {
    if (!Hive.isBoxOpen(boxInitName)) {
      await Hive.openBox<Statistics>(boxInitName);
    }
  }

  @override
  Future<void> boxAdd(int amountExpenses, int amountIncome, List<Transactions>transExpense, List<Transactions> transIncome) async {
    var box = Hive.box<Statistics>(boxInitName);
    box.add(Statistics(amountExpenses: amountExpenses, amountIncome: amountIncome, transExpense: transExpense, transIncome: transIncome));
  }

  @override
  Future<void> removeAllBox() async {
    var box = Hive.box<Statistics>(boxInitName);
    await box.clear();
  }

  @override
  Future<void> removeBox(int index) async {
    var box = Hive.box<Statistics>(boxInitName);
    box.deleteAt(index);
  }


}