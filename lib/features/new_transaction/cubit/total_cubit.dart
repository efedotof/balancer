import 'package:auto_route/auto_route.dart';
import 'package:balancer/box/budget/repository/budget_interface.dart';
import 'package:balancer/box/incomeAndExpense/repository/income_and_expense_interface.dart';
import 'package:balancer/features/home/cubit/budget_cubit.dart';
import 'package:balancer/features/home/cubit/statistics_cubit.dart';
import 'package:balancer/features/new_transaction/cubit/add_row_cubit.dart';
import 'package:balancer/features/new_transaction/cubit/new_transaction_cubit.dart';
import 'package:balancer/features/new_transaction/widget/category.dart';
import 'package:balancer/features/report/cubit/chart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'total_state.dart';
part 'total_cubit.freezed.dart';

class TotalCubit extends Cubit<TotalState> {
  TotalCubit(
      {required BudgetInterface interface,
      required IncomeAndExpenseInterface incomeAndExpenseInterface})
      : _incomeAndExpenseInterface = incomeAndExpenseInterface,
        _interface = interface,
        super(const TotalState.initial());

  int total = 0;

  final BudgetInterface _interface;
  final IncomeAndExpenseInterface _incomeAndExpenseInterface;

  void changeTotalBudget({required int amountsTotal}) {
    total += amountsTotal;
    emit(TotalState.changeTotal(total: total));
  }

  void addBox(
      {required BuildContext context,
      required TransactionCategory category}) async {
    final totals = total;

    // debugPrint('total to stat: $total');
    if (context.mounted) {
      final states = context.read<NewTransactionCubit>().state;
      final isSelected = states.selectedCategory == category;
      if (isSelected) {
        await updateLeftAndSpent(total);
        if (context.mounted) {
          final tranceIncome = context.read<AddRowCubit>().transactionsList;

          await _incomeAndExpenseInterface.boxAddIncome(
              time: DateTime.now(),
              amountIncome: total,
              transIncome: tranceIncome);
        }
        if (context.mounted) {
          context
              .read<StatisticsCubit>()
              .uploadStatistics(amountExpenses: 0, amountIncome: totals);
          context.read<ChartCubit>().getStatisticsToPie();
        }

        if (context.mounted) {
          context.maybePop();
        }

        totalToClean();

        final box = await _interface.getAllBudgets();
        if (context.mounted) {
          context.read<BudgetCubit>().updateBudget(
              amountBudget: box[0].amountBudget,
              spent: box[0].spent,
              left: box[0].left,
              expenses: box[0].expenses);
        }
      } else {
        _interface.replaceSpentToBox(0, total);
        final box = await _interface.getAllBudgets();

        if (context.mounted) {
          final tranceExpense = context.read<AddRowCubit>().transactionsList;
          await _incomeAndExpenseInterface.boxAddExpense(
              time: DateTime.now(),
              amountExpense: total,
              transExpense: tranceExpense);
          if (context.mounted) {
            context.read<BudgetCubit>().updateBudget(
                amountBudget: box[0].amountBudget,
                spent: box[0].spent,
                left: box[0].left,
                expenses: box[0].expenses);
            context
                .read<StatisticsCubit>()
                .uploadStatistics(amountExpenses: totals, amountIncome: 0);
            context.read<ChartCubit>().getStatisticsToPie();
            totalToClean();
            context.maybePop();
          }
        }
      }
    }
  }

  void totalToClean() {
    total = 0;
    emit(TotalState.changeTotal(total: total));
  }

  Future<void> updateLeftAndSpent(int value) async {
    await _interface.updateLeftAndSpent(0, value);
  }
}
