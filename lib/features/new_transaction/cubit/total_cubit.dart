import 'package:auto_route/auto_route.dart';
import 'package:balancer/box/budget/repository/budget_interface.dart';
import 'package:balancer/box/goals/repository/goals_interface.dart';
import 'package:balancer/box/incomeAndExpense/repository/income_and_expense_interface.dart';
import 'package:balancer/features/home/cubit/budget_cubit.dart';
import 'package:balancer/features/home/cubit/statistics_cubit.dart';
import 'package:balancer/features/new_transaction/cubit/add_row_cubit.dart';
import 'package:balancer/features/new_transaction/providers/add_new_goals_provider.dart';
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


  final BudgetInterface _interface;
  final IncomeAndExpenseInterface _incomeAndExpenseInterface;
  final GoalsInterface _goalsInterface;

  void changeTotalBudget({required BuildContext context}) {
    final total = context.read<AddNewGoalsProvider>().total;
    emit(TotalState.changeTotal(total: total));
  }

  void addBox(
      {required BuildContext context,
      required TransactionCategory category}) async {
    final total = context.read<AddNewGoalsProvider>().total;

    if (context.mounted && total > 0) {
      final states = context.read<NewTransactionCubit>().state;
      final isSelected = states.selectedCategory == category;
      if (isSelected) {
        debugPrint('category to addBox true: $category');
        await _addIncome(context, total, isSelected);
      } else {
        debugPrint('category to addBox false: $category');
        await _addExpenses(context, total, isSelected);
      }
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(S.of(context).oopsyouMadeAMistakeTheAmountShouldExceed1Ruble)));
    }
  }

  Future<void> _addIncome(
      BuildContext context, double totals, bool selected) async {
    await _updateBudgetAndStatistics(context, totals, selected, true);
    if (context.mounted) {
      await _addTransactionToGoal(context, selected, totals, true);
    }

    if (context.mounted) {
      context.read<StatisticsCubit>().getStatistics();
      context.read<ChartCubit>().getStatisticsToPie();
      context.read<AddRowCubit>().transToClean(context);
      context.read<NewTransactionCubit>().clean();
      context.read<AddNewTransactionsToGoalCubit>().cleanToGoals(context);
    }
  }

  Future<void> _addExpenses(
      BuildContext context, double total, bool selected) async {
    await _updateBudgetAndStatistics(context, total, selected, false);
    if (context.mounted) {
      await _addTransactionToGoal(context, selected, total, false);
    }
    if (context.mounted) {
      context.read<StatisticsCubit>().getStatistics();
      context.read<ChartCubit>().getStatisticsToPie();
      context.read<AddRowCubit>().transToClean(context);
      context.read<NewTransactionCubit>().clean();
      context.read<AddNewTransactionsToGoalCubit>().cleanToGoals(context);
    }
  }

  Future<void> _updateBudgetAndStatistics(BuildContext context, double totals, bool selected, bool isIncome) async {
    if (!context.mounted) return;
    debugPrint('totals^ $totals');


    if (context.mounted) {
      context.read<StatisticsCubit>().uploadStatistics(
            amountExpenses: isIncome ? 0 : totals,
            amountIncome: isIncome ? totals : 0,);
    }

    if (context.mounted) {
      context.read<StatisticsCubit>().getStatistics();
      context.read<ChartCubit>().getStatisticsToPie();
    }

    if (context.mounted) {
      final selectedGoal = context.read<AddNewGoalsProvider>().goalsToSelected;
      if(selectedGoal != null){

        await _interface.replaceBudgetValues(
          amount: totals,
          category:isIncome? TransactionCategory.expenses: TransactionCategory.income,
        );
      }else{
         await _interface.replaceBudgetValues(
          amount: totals,
          category:isIncome? TransactionCategory.income: TransactionCategory.expenses,
        );
      }

      if (context.mounted) {
        context.read<BudgetCubit>().updateBudget();
      }
    }
  }

  Future<void> _addTransactionToGoal(
    BuildContext context,
    bool selected,
    double totals,
    bool isIncome,
  ) async {
    if (context.mounted) {
      final tranceList = context.read<AddRowCubit>().transactionsList;
      final categorysList = context.read<AddRowCubit>().categorys;
      final datesNew = context.read<AddNewGoalsProvider>().time;
      final selectedGoal = context.read<AddNewGoalsProvider>().goalsToSelected;

      final iconD =
          categorysList.map((icon) => getIcon(icon).codePoint).toList();
      final arbData =
          categorysList.map((category) => category.toString()).toList();
      final amounts =
          tranceList.map((transaction) => transaction.amount).toList();
      final names =
          tranceList.map((transaction) => transaction.nameTrans).toList();
      final dates = tranceList.map((transaction) {
        if (datesNew != null) {
          return datesNew;
        } else {
          return transaction.date;
        }
      }).toList();

      if (selectedGoal != null) {
        if (isIncome) {
          await _incomeAndExpenseInterface.boxAddExpense(
            subtitle: "to_the_goal",
            time: datesNew ?? DateTime.now(),
            amountExpense: totals,
            transExpense: tranceList,
            iconD: iconD,
            arbDate: arbData,
          );
          await _goalsInterface.addTransactionToGoal(
            goal: selectedGoal,
            amounts: amounts,
            namesTrans: names,
            dates: dates,
            arbDateTransName: arbData,
            category: TransactionCategory.income,
            incomeOrExpenses: List.filled(names.length, true),
          );
          if (context.mounted) {
            context.maybePop();

            context.pushRoute(
                SuccessfullyRoute(subtitle: S.of(context).transaction_added));
          }
        } else {
          if (selectedGoal.goalsFilled > 0 &&
              totals <= selectedGoal.goalsFilled) {
            await _incomeAndExpenseInterface.boxAddIncome(
              subtitle: "to_the_goal",
              time: datesNew ?? DateTime.now(),
              amountIncome: totals,
              transIncome: tranceList,
              iconD: iconD,
              arbDate: arbData,
            );
            await _goalsInterface.addTransactionToGoal(
              goal: selectedGoal,
              amounts: amounts,
              namesTrans: names,
              dates: dates,
              arbDateTransName: arbData,
              category: TransactionCategory.expenses,
              incomeOrExpenses: List.filled(names.length, false),
            );
            if (context.mounted) {
              context.maybePop();

              context.pushRoute(
                  SuccessfullyRoute(subtitle: S.of(context).transaction_added));
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(S.of(context).youCantWithdrawMoneyFromTheGoal),
              ),
            );
            return;
          }
        }
      } else {
        if (isIncome) {
          await _incomeAndExpenseInterface.boxAddIncome(
            subtitle: null,
            time: datesNew ?? DateTime.now(),
            amountIncome: totals,
            transIncome: tranceList,
            iconD: iconD,
            arbDate: arbData,
          );
        } else {
          await _incomeAndExpenseInterface.boxAddExpense(
            subtitle: null,
            time: datesNew ?? DateTime.now(),
            amountExpense: totals,
            transExpense: tranceList,
            iconD: iconD,
            arbDate: arbData,
          );
        }
        if (context.mounted) {
          context.maybePop();

          context.pushRoute(
              SuccessfullyRoute(subtitle: S.of(context).transaction_added));
        }
      }

      if (context.mounted) {
        context.read<AddNewTransactionsToGoalCubit>().cleanToGoals(context);
        totalToClean(context: context);
      }
    }
  }

  void totalToClean({required BuildContext context}) {

    if(context.mounted){
      context.read<AddNewGoalsProvider>().totalToClean();
    }
    emit(TotalState.changeTotal(total:  context.read<AddNewGoalsProvider>().total));
  }

  Future<void> updateLeftAndSpent(double value) async {
    await _interface.updateLeftAndSpent(value);
  }
}
