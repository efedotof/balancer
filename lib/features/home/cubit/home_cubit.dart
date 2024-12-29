import 'package:auto_route/auto_route.dart';
import 'package:balancer/features/home/cubit/balancer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:balancer/features/home/widget/widget.dart';
import 'package:equatable/equatable.dart';

import '../../../Theme/constants/constants.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(const HomeInitial());


  int _selectedIndex = 0;
  List<String> get nameChip => AppStrings.filterNames;

  void selectFilter(int index) {
    _selectedIndex = index;

    emit(FilterSelected(selectedIndex: _selectedIndex));
  }



  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
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

  Future<void> addNewBoxTransaction(
      BuildContext context, String amount, DateTime time, String title) async {
    emit(AddNewBox());
    if (!amount.startsWith('+') && !amount.startsWith('-')) {
      amount = '+$amount';
    }

    final isIncome = amount.startsWith('+');
    final parsedAmount = double.parse(amount.replaceAll(RegExp(r'[^\d.]'), ''));

    context
        .read<BalancerCubit>()
        .updateBalance(parsedAmount, isIncome: isIncome);

    if(context.mounted){
    context.maybePop();
    }
    
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


  String formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year;

    return '$day.$month.$year'; 
  }



  bool isToday(DateTime date) {
    final now = DateTime.now();
    return now.year == date.year &&
        now.month == date.month &&
        now.day == date.day;
  }

double calculateProgress(double spent, double goalAmount) {
  if (goalAmount == 0) return 0; 
  double progress = double.parse((spent / goalAmount).toStringAsFixed(2));
 
  if (progress < 0) {
    progress = 0;
  }


  debugPrint('progressDouble: $progress');
  return progress;
}




}
