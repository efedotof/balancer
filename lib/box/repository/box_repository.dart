import 'dart:developer';

import 'package:balancer/box/repository/box_interface.dart';
import 'package:balancer/box/transaction.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BoxRepository implements BoxInterface {
var boxInitName = 'transaction_box';

  BoxRepository() {
    initHive();
  }

  Future<void> initHive() async {
    await Hive.initFlutter();
    log('Hive initialized', name: 'Hive');

    if (!Hive.isAdapterRegistered(TransactionAdapter().typeId)) {
      Hive.registerAdapter(TransactionAdapter());
      log('Hive registrationAdapter', name: 'Hive');
    }

    await Hive.openBox<Transaction>(boxInitName);
    log('Hive opened', name: 'Hive');
  }

  @override
  Future<void> initBox() async {
    if (!Hive.isBoxOpen(boxInitName)) {
      await Hive.openBox<Transaction>(boxInitName);
    }
  }

  @override
  Future<void> boxAdd(String title,  String amount,  DateTime date) async {
    var box = Hive.box<Transaction>(boxInitName);
    box.add(Transaction(title: title, amount: amount, date: date));
  }

  @override
  Future<void> removeAllBox() async {
    var box = Hive.box<Transaction>(boxInitName);
    await box.clear();
  }

  @override
  Future<void> removeBox(int index) async {
    var box = Hive.box<Transaction>(boxInitName);
    box.deleteAt(index);
  }
}