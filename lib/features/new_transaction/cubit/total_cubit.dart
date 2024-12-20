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

  void addBox(
      {required BuildContext context,
      required TransactionCategory category}) async {
    final totals = total;

    if (context.mounted) {
      final states = context.read<NewTransactionCubit>().state;
      final isSelected = states.selectedCategory == category;
      if (isSelected) {
            debugPrint('category to addBox true: $category');
        _addIncome(context, totals, isSelected);
      } else {
       debugPrint('category to addBox false: $category');
        _addExpenses(context, totals, isSelected);
      }
    }
  }

  void _addIncome(
      BuildContext context, int totals, bool selected) async {
    await updateLeftAndSpent(total);
    if (context.mounted) {
      if (context.read<AddNewGoalsProvider>().goalsToSelected != null) {
        final tranceIncome = context.read<AddRowCubit>().transactionsList;
        final amounts =
            tranceIncome.map((transaction) => transaction.amount).toList();
        final namesTrans =
            tranceIncome.map((transaction) => transaction.nameTrans).toList();
        final dates =
            tranceIncome.map((transaction) => transaction.date).toList();

        _goalsInterface.addTransactionToGoal(
          context.read<AddNewGoalsProvider>().goalsToSelected!,
          amounts,
          namesTrans,
          dates,
          selected? TransactionCategory.income: TransactionCategory.expenses,
        );

        await _incomeAndExpenseInterface.boxAddIncome(
          time: DateTime.now(),
          amountIncome: total,
          transIncome: tranceIncome,
        );
      }
    }

    if (context.mounted) {
      context
          .read<StatisticsCubit>()
          .uploadStatistics(amountExpenses: 0, amountIncome: totals);
      context.read<ChartCubit>().getStatisticsToPie();

      if (context.mounted) {
        context.maybePop();
         context.pushRoute( SuccessfullyRoute(subtitle: 'Transaction добавлена'));
      }

      totalToClean();
      context.read<AddNewTransactionsToGoalCubit>().cleanToGoals();
      final box = await _interface.getAllBudgets();
      if (context.mounted) {
        context.read<BudgetCubit>().updateBudget(
              amountBudget: box[0].amountBudget,
              spent: box[0].spent,
              left: box[0].left,
              expenses: box[0].expenses,
            );
      }
    }
  }

  void _addExpenses(
      BuildContext context, int totals,  bool selected) async {
    if (context.mounted) {
      if (context.read<AddNewGoalsProvider>().goalsToSelected != null) {
        _interface.replaceSpentToBox(total);
        final box = await _interface.getAllBudgets();

        if (context.mounted) {
          final tranceExpense = context.read<AddRowCubit>().transactionsList;
          final amounts =
              tranceExpense.map((transaction) => transaction.amount).toList();
          final namesTrans = tranceExpense
              .map((transaction) => transaction.nameTrans)
              .toList();
          final dates =
              tranceExpense.map((transaction) => transaction.date).toList();

          _goalsInterface.addTransactionToGoal(
            context.read<AddNewGoalsProvider>().goalsToSelected!,
            amounts,
            namesTrans,
            dates,
             selected? TransactionCategory.income: TransactionCategory.expenses,
          );

          await _incomeAndExpenseInterface.boxAddExpense(
            time: DateTime.now(),
            amountExpense: total,
            transExpense: tranceExpense,
          );

          if (context.mounted) {
            context.read<BudgetCubit>().updateBudget(
                  amountBudget: box[0].amountBudget,
                  spent: box[0].spent,
                  left: box[0].left,
                  expenses: box[0].expenses,
                );
            context
                .read<StatisticsCubit>()
                .uploadStatistics(amountExpenses: totals, amountIncome: 0);
            context.read<ChartCubit>().getStatisticsToPie();
            context.read<AddNewTransactionsToGoalCubit>().cleanToGoals();
            totalToClean();
            context.maybePop();
             context.pushRoute( SuccessfullyRoute(subtitle: 'Transaction добавлена'));
          }
        }
      } else {
        _interface.replaceSpentToBox(total);
        final box = await _interface.getAllBudgets();

        if (context.mounted) {
          final tranceExpense = context.read<AddRowCubit>().transactionsList;
          await _incomeAndExpenseInterface.boxAddExpense(
            time: DateTime.now(),
            amountExpense: total,
            transExpense: tranceExpense,
          );

          if (context.mounted) {
            context.read<BudgetCubit>().updateBudget(
                  amountBudget: box[0].amountBudget,
                  spent: box[0].spent,
                  left: box[0].left,
                  expenses: box[0].expenses,
                );
            context
                .read<StatisticsCubit>()
                .uploadStatistics(amountExpenses: totals, amountIncome: 0);
            context.read<ChartCubit>().getStatisticsToPie();
            context.read<AddNewTransactionsToGoalCubit>().cleanToGoals();
            totalToClean();
            context.maybePop();
            context.pushRoute( SuccessfullyRoute(subtitle: 'Transaction добавлена'));
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
    await _interface.updateLeftAndSpent(value);
  }
}
