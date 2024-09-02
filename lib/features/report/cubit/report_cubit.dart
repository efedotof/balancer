import 'package:balancer/box/transaction.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit() : super(ReportInitial()) {
    _listenToTransactionChanges();
  }

  final transactionBox = Hive.box<Transaction>('transaction_box');

  void _listenToTransactionChanges() {
    transactionBox.listenable().addListener(() {
      _emitUpdatedState();
    });
  }

  List<Transaction> getTransactions(bool isIncome) {
    return transactionBox.values.where((transaction) =>
      isIncome ? transaction.amount.startsWith('+') : transaction.amount.startsWith('-')
    ).toList();
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
    final state = this.state;
    if (state is IncomeExpenseToggled) {
      final transactions = getTransactions(state.isIncome);
      emit(ReportUpdated(transactions, calculateCategoryTotals(transactions), calculateTotal(transactions)));
    }
  }
}
