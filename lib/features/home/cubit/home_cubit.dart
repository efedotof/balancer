import 'package:auto_route/auto_route.dart';
import 'package:balancer/features/home/cubit/balancer_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:balancer/box/transaction.dart';
import 'package:balancer/features/home/repository/home_interface.dart';
import 'package:balancer/features/home/widget/widget.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../constants.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required HomeInterface interface})
      : _interface = interface,
        super(const HomeInitial()) {
    filterTransactions(0); 
  }

  final HomeInterface _interface;
  final transactionBox = Hive.box<Transaction>('transaction_box');
  final ValueNotifier<List<Transaction>> _transactionsNotifier = ValueNotifier([]);

  int _selectedIndex = 0;
  List<String> get nameChip => AppStrings.filterNames;

  void selectFilter(int index) {
    _selectedIndex = index;
    filterTransactions(index);
    emit(FilterSelected(selectedIndex: _selectedIndex));
  }

  void filterTransactions(int index) {
    final now = DateTime.now();
    final filteredTransactions = transactionBox.values.where((transaction) {
      final transactionDate = transaction.date;
      if (index == 0) return true; 
      if (index == 1) return _isSameDay(transactionDate, now); 
      if (index == 2) return _isSameDay(transactionDate, now.subtract(const Duration(days: 1))); 
      if (index == 3) return transactionDate.isAfter(now.subtract(const Duration(days: 7)));
      return false;
    }).toList();

    _transactionsNotifier.value = filteredTransactions;
    emit(TransactionsFiltered(transactions: filteredTransactions));
  }

  void clearTransactions() {
    _transactionsNotifier.value = [];
    emit(const TransactionsFiltered(transactions: []));
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
  }

  void showAddModel(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      isScrollControlled: true,
      builder: (context) => const AddTransactionModel(),
    );
  }

  Future<void> addNewBoxTransaction(BuildContext context, String amount, DateTime time, String title) async {
    emit(AddNewBox());

    final isIncome = amount.startsWith('+');
    final parsedAmount = double.parse(amount.replaceAll(RegExp(r'[^\d.]'), ''));

    context.read<BalancerCubit>().updateBalance(parsedAmount, isIncome: isIncome);

    await _interface.addNewBox(title, amount, time);


    filterTransactions(_selectedIndex);
    context.maybePop();
  }

  String formatNumber(double number) {
    final absNumber = number.abs();
    if (absNumber >= 1e18) {
      return '${(number / 1e18).toStringAsFixed(2)} квинт'; 
    } else if (absNumber >= 1e15) {
      return '${(number / 1e15).toStringAsFixed(2)} квадр'; 
    } else if (absNumber >= 1e12) {
      return '${(number / 1e12).toStringAsFixed(2)} трлн'; 
    } else if (absNumber >= 1e9) {
      return '${(number / 1e9).toStringAsFixed(2)} млрд'; 
    } else if (absNumber >= 1e6) {
      return '${(number / 1e6).toStringAsFixed(2)} млн'; 
    } else if (absNumber >= 1e3) {
      return '${(number / 1e3).toStringAsFixed(2)} тыс'; 
    } else {
      return number.toStringAsFixed(2);
    }
  }



  ValueListenable<List<Transaction>> get transactionsNotifier => _transactionsNotifier;
}
