import 'package:auto_route/auto_route.dart';
import 'package:balancer/box/budget/repository/budget_interface.dart';
import 'package:balancer/box/goals/repository/goals_interface.dart';
import 'package:balancer/box/incomeAndExpense/repository/income_and_expense_interface.dart';
import 'package:balancer/box/statistics/repository/statistics_interface.dart';
import 'package:balancer/features/home/cubit/balancer_cubit.dart';
import 'package:balancer/features/home/cubit/home_cubit.dart';
import 'package:balancer/router/router.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({
    required BudgetInterface budgetInterface,
    required StatisticsInterface statiscticsInterface,
    required GoalsInterface goalsInterface,
    required IncomeAndExpenseInterface incomeAndExpenseInterface,
    required this.prefs,
    required this.homeCubit,
    required this.balancerCubit,
  }) : _incomeAndExpenseInterface = incomeAndExpenseInterface, _goalsInterface = goalsInterface, _statiscticsInterface = statiscticsInterface, _budgetInterface = budgetInterface, super(SettingsInitial());

  final SharedPreferences prefs;
  final HomeCubit homeCubit;
  final BalancerCubit balancerCubit;
  final BudgetInterface _budgetInterface;
  final StatisticsInterface _statiscticsInterface;
  final GoalsInterface _goalsInterface;
  final IncomeAndExpenseInterface _incomeAndExpenseInterface;

 void _clearAppCash(BuildContext context) async {
  try {
 
    await _removeAllBoxes();
    
    if (context.mounted) {
      context.maybePop(); 

    }
  } catch (e) {
    debugPrint('Ошибка при очистке данных: $e');
  }
}

Future<void> _removeAllBoxes() async {
  await Future.wait([
    _budgetInterface.removeAllBox(),
    _statiscticsInterface.removeAllBox(),
    _goalsInterface.removeAllBox(),
    _incomeAndExpenseInterface.removeAllBox(),
  ]);
}

void clearAll(BuildContext context) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Подтвердите удаление"),
        content: const Text("Вы уверены, что хотите удалить все данные?"),
        actions: <Widget>[
          TextButton(
            onPressed: () => context.maybePop(),
            child: const Text("Отмена"),
          ),
          TextButton(
            onPressed: () {
            
              _clearAppCash(context);
            },
            child: const Text("Удалить"),
          ),
        ],
      );
    },
  );
}


  void pushAbout(BuildContext context) {
    context.pushRoute(const AboutRoute());
  }
}
