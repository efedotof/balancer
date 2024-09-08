import 'package:balancer/box/transaction.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit() : super(ReportInitial()) {
    _emitUpdatedState();
    _listenToTransactionChanges();
  }

  final transactionBox = Hive.box<Transaction>('transaction_box');

  void _listenToTransactionChanges() {
    transactionBox.listenable().addListener(() {
      _emitUpdatedState();
    });
  }

  List<Transaction> getTransactions(bool isIncome) {
    return transactionBox.values
        .where((transaction) =>
            isIncome ? transaction.amount.startsWith('+') : transaction.amount.startsWith('-'))
        .toList()
        .reversed
        .toList();  
  }

  double calculateTotal(List<Transaction> transactions) {
    return transactions.fold(0, (sum, transaction) {
      final parsedAmount = double.parse(transaction.amount.replaceAll(RegExp(r'[^\d.]'), ''));
      return sum + parsedAmount;
    });
  }

  Map<String, double> calculateCategoryTotals(List<Transaction> transactions) {
    final Map<String, double> categoryTotals = {};

    for (var transaction in transactions) {
      final parsedAmount = double.parse(transaction.amount.replaceAll(RegExp(r'[^\d.]'), ''));
      categoryTotals.update(transaction.title, (value) => value + parsedAmount, ifAbsent: () => parsedAmount);
    }

    return categoryTotals;
  }

  void toggleIncomeExpense(bool isIncome) {
    emit(IncomeExpenseToggled(isIncome));
    _emitUpdatedState();
  }

  void _emitUpdatedState() {
    final isIncome = (state is IncomeExpenseToggled) ? (state as IncomeExpenseToggled).isIncome : false;
    final transactions = getTransactions(isIncome);
    emit(ReportUpdated(transactions, calculateCategoryTotals(transactions), calculateTotal(transactions)));
  }

  Color getColorForCategory(String category) {
    switch (category) {
      case 'Еда':
        return Colors.orangeAccent;
      case 'Транспорт':
        return Colors.blueAccent;
      case 'Отели':
        return Colors.greenAccent;
      case 'Одежда, обувь':
        return Colors.purpleAccent;
      case 'Супермаркеты':
        return Colors.redAccent;
      case 'Рестораны':
        return Colors.deepOrangeAccent;
      case 'Сервис, услуги':
        return Colors.indigoAccent;
      case 'Развлечения':
        return Colors.tealAccent;
      case 'Цифровые товары':
        return Colors.cyanAccent;
      case 'Финансовые услуги':
        return Colors.lightBlueAccent;
      case 'Авиабилеты':
        return Colors.pinkAccent;
      case 'Косметика и бытовые товары':
        return Colors.amberAccent;
      case 'Зарплата':
        return Colors.limeAccent;
      case 'Иной доход':
        return Colors.lightGreenAccent;
      default:
        return Colors.grey;
    }
  }

  String formatAmount(String amountString) {
    final double amount = double.tryParse(amountString.replaceAll(RegExp(r'[^\d.-]'), '')) ?? 0.0;
    final absNumber = amount.abs();
    if (absNumber >= 1e18) {
      return '${(amount / 1e18).toStringAsFixed(2)} квинт'; 
    } else if (absNumber >= 1e15) {
      return '${(amount / 1e15).toStringAsFixed(2)} квадр'; 
    } else if (absNumber >= 1e12) {
      return '${(amount / 1e12).toStringAsFixed(2)} трлн'; 
    } else if (absNumber >= 1e9) {
      return '${(amount / 1e9).toStringAsFixed(2)} млрд'; 
    } else if (absNumber >= 1e6) {
      return '${(amount / 1e6).toStringAsFixed(2)} млн';
    } else if (absNumber >= 1e3) {
      return '${(amount / 1e3).toStringAsFixed(2)} тыс'; 
    } else {
      return amount.toStringAsFixed(2); 
    }
  }


}
