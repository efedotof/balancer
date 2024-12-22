import 'package:balancer/box/budget/budget.dart';
import 'package:balancer/box/budget/repository/budget_interface.dart';
import 'package:balancer/box/goals/repository/goals_interface.dart';
import 'package:balancer/features/new_transaction/widget/category.dart';
import 'package:balancer/generated/l10n.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'budget_state.dart';
part 'budget_cubit.freezed.dart';

class BudgetCubit extends Cubit<BudgetState> {
  BudgetCubit({required GoalsInterface goalsInterface
  ,required BudgetInterface interface})
      : _goalsInterface = goalsInterface, _interface = interface,
        super(const BudgetState.initial()) {
    getBudget();
  }

  final BudgetInterface _interface;
  final GoalsInterface _goalsInterface;

 Future<void> getBudget() async {
    try {
      final box = Hive.box<Budget>('Budget_box');
      final now = DateTime.now();


      if (now.day == 1) {
        emit(const BudgetState.empty());
        return;
      }

      if (box.isEmpty) {
        emit(const BudgetState.empty());
      } else {
        final budget = box.getAt(box.length - 1);
        if (budget != null) {
          emit(BudgetState.isNotEmpty(
            budgetAmount: budget.amountBudget,
            spent: budget.spent,
            left: budget.left,
          ));

        } else {
          debugPrint('error');
        }
      }
    } catch (e) {
      debugPrint('error budget: $e');
    }
  }




Future<void> addBudget(
  BuildContext context, {
  required int amountBudget,
  int? spent,
  int? left,
  int? expenses,
}) async {
  try {
    // Добавляем бюджет в хранилище
    _interface.boxAdd(amountBudget, spent, left, expenses);

    // Получаем последний добавленный бюджет
    final box = Hive.box<Budget>('Budget_box');
    final budget = box.isNotEmpty ? box.getAt(box.length - 1) : null;

    if (budget == null) {
      debugPrint('Ошибка: Не удалось получить последний бюджет.');
      return;
    }

    // Обновляем состояние
    emit(BudgetState.updateBudget(
      budgetAmount: budget.amountBudget,
      spent: budget.spent,
      left: budget.left,
    ));

    // Получаем цели с процентами от бюджета
    final goalsWithPercentage = await _goalsInterface.getGoalsWithPercentageOfTheBudget();

    for (var goal in goalsWithPercentage) {
      final percentage = goal.percentageOfTheBudget ?? 0;
      final allocatedAmount = (amountBudget * percentage / 100).toInt();

      if (context.mounted) {
        // Добавляем транзакцию к цели
        await _goalsInterface.addTransactionToGoal(
          goal,
          [allocatedAmount],
          [S.of(context).budgetAllocation],
          [DateTime.now()],
          TransactionCategory.income,
        );
      }

      debugPrint('Распределено $allocatedAmount на цель: ${goal.nameGoals}');
    }

    // Обновляем значения бюджета
    int allocatedAmountTotal = goalsWithPercentage.fold(
      0,
      (sum, goal) => sum + ((amountBudget * (goal.percentageOfTheBudget ?? 0) / 100).toInt()),
    );

    _interface.replaceBudgetValues(
      newAmountBudget: budget.amountBudget - allocatedAmountTotal,
      newLeft: (budget.left ?? 0) - allocatedAmountTotal,
      newSpent: (budget.spent ?? 0) + allocatedAmountTotal,
    );
    updateBudget();
  } catch (e, stackTrace) {
    debugPrint('Ошибка в addBudget: $e\n$stackTrace');
  }
}


  Future<void> updateBudget() async {
    try {
     final box = Hive.box<Budget>('Budget_box');
      final budget = box.getAt(box.length - 1); 
      if(budget != null){
          emit(BudgetState.updateBudget(
           budgetAmount: budget.amountBudget,
          spent: budget.spent,
          left: budget.left,));  
      }
    
    } catch (e) {
      debugPrint('error to update budget: $e');
    }
  }
}
