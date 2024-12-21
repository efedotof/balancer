import 'package:auto_route/auto_route.dart';
import 'package:balancer/box/budget/repository/budget_interface.dart';
import 'package:balancer/box/goals/repository/goals_interface.dart';
import 'package:balancer/box/incomeAndExpense/repository/income_and_expense_interface.dart';
import 'package:balancer/features/home/cubit/budget_cubit.dart';
import 'package:balancer/features/home/cubit/statistics_cubit.dart';
import 'package:balancer/features/new_transaction/cubit/add_row_cubit.dart';
import 'package:balancer/features/new_transaction/cubit/cubit/providers/add_new_goals_provider.dart';
import 'package:balancer/features/new_transaction/cubit/new_transaction_cubit.dart';
import 'package:balancer/features/new_transaction/widget/category.dart';
import 'package:balancer/features/report/cubit/chart_cubit.dart';
import 'package:balancer/generated/l10n.dart';
import 'package:balancer/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'cubit/add_new_transactions_to_goal_cubit.dart';

part 'total_state.dart';
part 'total_cubit.freezed.dart';

class TotalCubit extends Cubit<TotalState> {
  TotalCubit(
      {required BudgetInterface interface,
      required GoalsInterface goalsInterface,
      required IncomeAndExpenseInterface incomeAndExpenseInterface})
      : _goalsInterface = goalsInterface,
        _incomeAndExpenseInterface = incomeAndExpenseInterface,
        _interface = interface,
        super(const TotalState.initial());

  int total = 0;

  final BudgetInterface _interface;
  final IncomeAndExpenseInterface _incomeAndExpenseInterface;
  final GoalsInterface _goalsInterface;

  void changeTotalBudget({required int amountsTotal}) {
    total += amountsTotal;
    emit(TotalState.changeTotal(total: total));
  }

  void addBox({required BuildContext context, required TransactionCategory category}) async {
  final totals = total;

  if (context.mounted) {
    final states = context.read<NewTransactionCubit>().state;
    final isSelected = states.selectedCategory == category;
    if (isSelected) {
      debugPrint('category to addBox true: $category');
      await _addIncome(context, totals, isSelected);
    } else {
      debugPrint('category to addBox false: $category');
      await _addExpenses(context, totals, isSelected);
    }
  }
}

Future<void> _addIncome(BuildContext context, int totals, bool selected) async {
  await _updateBudgetAndStatistics(context, totals, selected, true);
  await _addTransactionToGoal(context, selected, totals, true);
  if (context.mounted) {
    context.read<StatisticsCubit>().getStatistics();
    context.read<ChartCubit>().getStatisticsToPie();
    context.read<AddRowCubit>().transToClean();
  }
}

Future<void> _addExpenses(BuildContext context, int totals, bool selected) async {
  await _updateBudgetAndStatistics(context, totals, selected, false);
  await _addTransactionToGoal(context, selected, totals, false);
  if (context.mounted) {
    context.read<StatisticsCubit>().getStatistics();
    context.read<ChartCubit>().getStatisticsToPie();
    context.read<AddRowCubit>().transToClean();
  }
}


  Future<void> _updateBudgetAndStatistics(
      BuildContext context, int totals, bool selected, bool isIncome) async {
    if (!context.mounted) return; 

    final box = await _interface.getAllBudgets();
    debugPrint('totals^ $totals');
    if (context.mounted) {
      context.read<StatisticsCubit>().uploadStatistics(
            amountExpenses: isIncome ? 0 : totals,
            amountIncome: isIncome ? totals : 0,
          );
    }

    if (context.mounted) {
      context.read<StatisticsCubit>().getStatistics();
      context.read<ChartCubit>().getStatisticsToPie();
    }

    final budget = box.isNotEmpty ? box[0] : null;
    if (budget != null && context.mounted) {
      context.read<BudgetCubit>().updateBudget(
            amountBudget: budget.amountBudget,
            spent: budget.spent,
            left: budget.left,
            expenses: budget.expenses,
          );
      context.maybePop();
      context.pushRoute(
          SuccessfullyRoute(subtitle: S.of(context).transaction_added));
    }
  }

  Future<void> _addTransactionToGoal(
      BuildContext context, bool selected, int totals, bool isIncome) async {
    if (context.mounted) {
      final tranceList = context.read<AddRowCubit>().transactionsList;
      final amounts =
          tranceList.map((transaction) => transaction.amount).toList();
      final names =
          tranceList.map((transaction) => transaction.nameTrans).toList();
      final dates = tranceList.map((transaction) => transaction.date).toList();

      final category =
          selected ? TransactionCategory.income : TransactionCategory.expenses;

      if (context.read<AddNewGoalsProvider>().goalsToSelected != null) {
        _goalsInterface.addTransactionToGoal(
          context.read<AddNewGoalsProvider>().goalsToSelected!,
          amounts,
          names,
          dates,
          category,
        );
  }
        if (isIncome) {
          _incomeAndExpenseInterface.boxAddIncome(
            time: DateTime.now(),
            amountIncome: totals,
            transIncome: tranceList,
          );
        } else {
          _incomeAndExpenseInterface.boxAddExpense(
            time: DateTime.now(),
            amountExpense: totals,
            transExpense: tranceList,
          );
        }

        if (context.mounted) {
          context.read<AddNewTransactionsToGoalCubit>().cleanToGoals();
          totalToClean();
        }
    }
  }

  void totalToClean() {
    total = 0;
    emit(TotalState.changeTotal(total: total));
  }

  Future<void> updateLeftAndSpent(int value) async {
    await _interface.updateLeftAndSpent(value);
  }
}
