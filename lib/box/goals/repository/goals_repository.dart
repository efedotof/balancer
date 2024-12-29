import 'package:balancer/box/goals/goals.dart';
import 'package:balancer/features/new_transaction/widget/category.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'goals_interface.dart';

class GoalsRepository implements GoalsInterface {
  var boxInitName = 'goals_box';

  GoalsRepository() {
    initHive();
  }

  Future<void> initHive() async {
    await Hive.initFlutter();
    debugPrint('Hive initialized');

    if (!Hive.isAdapterRegistered(GoalsAdapter().typeId)) {
      Hive.registerAdapter(GoalsAdapter());
      debugPrint('Hive registered Goals Adapter');
    }

    await Hive.openBox<Goals>(boxInitName);
    debugPrint('Hive Goals opened');
  }

  @override
  Future<void> initBox() async {
    if (!Hive.isBoxOpen(boxInitName)) {
      await Hive.openBox<Goals>(boxInitName);
    }
  }

  @override
  Future<void> boxAdd(
    String title,
    double goalsAmount,
    double? goalsFilled,
    double? percentageOfBudget,
    List<double>? amounts,
    List<String>? namesTrans,
    List<DateTime>? dates,
    double? spentAmount,
    int inCode,
  ) async {
    var box = Hive.box<Goals>(boxInitName);
    box.add(Goals(
      nameGoals: title,
      goalsAmount: goalsAmount,
      goalsFilled: goalsFilled ?? 0,
      percentageOfTheBudget: percentageOfBudget ?? 0,
      amounts: amounts ?? [],
      namesTrans: namesTrans ?? [],
      dates: dates ?? [],
      spentAmount: spentAmount ?? 0,
      iconCode: inCode,
    ));
  }

  @override
  Future<void> removeAllBox() async {
    var box = Hive.box<Goals>(boxInitName);
    await box.clear();
  }

  @override
  Future<void> removeBox(Goals goal) async {
    var box = Hive.box<Goals>(boxInitName);
    int? index = box.values.toList().indexOf(goal);

    if (index != -1) {
      await box.deleteAt(index);
    }
  }

  @override
  Future<void> addTransactionToGoal({
    required Goals goal,
    required List<double> amounts,
    required List<String> namesTrans,
    required List<DateTime> dates,
    List<String>? arbDateTransName,
    required TransactionCategory category,
    List<bool>? incomeOrExpenses,
  }) async {
    var box = Hive.box<Goals>(boxInitName);

    var goalKey = box.keys.firstWhere(
      (key) => box.get(key) == goal,
      orElse: () => null,
    );
    if (goalKey != null) {
      final updatedAmounts = List<double>.from(goal.amounts)..addAll(amounts);
      final updatedNamesTrans = List<String>.from(goal.namesTrans)
        ..addAll(namesTrans);
      final updatedDates = List<DateTime>.from(goal.dates)..addAll(dates);

      debugPrint(category.toString());

      final double totalAmount = amounts.fold(0, (sum, amount) => sum + amount);

      final updatedGoalsFilled = category == TransactionCategory.income
          ? goal.goalsFilled + totalAmount
          : category == TransactionCategory.expenses
              ? goal.goalsFilled - totalAmount
              : goal.goalsFilled;

      final updatedSpentAmount = category == TransactionCategory.income
          ? goal.spentAmount - totalAmount
          : category == TransactionCategory.expenses
              ? goal.spentAmount + totalAmount
              : goal.spentAmount;

      final updatedArbDateNameTrans =
          List<String>.from(goal.arbDateNameTrans ?? [])
            ..addAll(arbDateTransName ?? []);

      final updatedIncomeOrExpenses =
          List<bool>.from(goal.incomeOrExpenses ?? [])
            ..addAll(incomeOrExpenses ?? []);

      final updatedGoal = Goals(
        nameGoals: goal.nameGoals,
        goalsAmount: goal.goalsAmount,
        spentAmount: updatedSpentAmount,
        goalsFilled: updatedGoalsFilled,
        percentageOfTheBudget: goal.percentageOfTheBudget,
        amounts: updatedAmounts,
        namesTrans: updatedNamesTrans,
        dates: updatedDates,
        iconCode: goal.iconCode,
        arbDateNameTrans: updatedArbDateNameTrans,
        incomeOrExpenses: updatedIncomeOrExpenses,
      );

      await box.put(goalKey, updatedGoal);
    }
  }

  @override
  Future<void> updateGoalName(Goals goal, String newName) async {
    var box = Hive.box<Goals>(boxInitName);

    var goalKey = box.keys.firstWhere(
      (key) => box.get(key) == goal,
      orElse: () => null,
    );

    if (goalKey != null) {
      final updatedGoal = Goals(
        nameGoals: newName,
        goalsAmount: goal.goalsAmount,
        spentAmount: goal.spentAmount,
        goalsFilled: goal.goalsFilled,
        percentageOfTheBudget: goal.percentageOfTheBudget,
        amounts: goal.amounts,
        namesTrans: goal.namesTrans,
        dates: goal.dates,
        iconCode: goal.iconCode,
      );

      await box.put(goalKey, updatedGoal);
    }
  }

  @override
  Future<void> updateGoalAmount(Goals goal, double newAmount) async {
    var box = Hive.box<Goals>(boxInitName);

    final goalKey = box.keys.firstWhere(
      (key) {
        final storedGoal = box.get(key);
        return storedGoal != null && storedGoal.nameGoals == goal.nameGoals;
      },
      orElse: () => null,
    );

    if (goalKey != null) {
      final updatedGoal = Goals(
        nameGoals: goal.nameGoals,
        goalsAmount: newAmount,
        spentAmount: goal.spentAmount,
        goalsFilled: goal.goalsFilled,
        percentageOfTheBudget: goal.percentageOfTheBudget,
        amounts: goal.amounts,
        namesTrans: goal.namesTrans,
        dates: goal.dates,
        iconCode: goal.iconCode,
      );

      await box.put(goalKey, updatedGoal);
    } else {
      throw Exception('Goal not found in Hive box');
    }
  }

  @override
  Future<void> updateGoalAmountAndName(
      Goals goal, double newAmount, String name) async {
    var box = Hive.box<Goals>(boxInitName);

    final goalKey = box.keys.firstWhere(
      (key) {
        final storedGoal = box.get(key);
        return storedGoal != null && storedGoal.nameGoals == goal.nameGoals;
      },
      orElse: () => null,
    );

    if (goalKey != null) {
      final updatedGoal = Goals(
        nameGoals: name,
        goalsAmount: newAmount,
        spentAmount: goal.spentAmount,
        goalsFilled: goal.goalsFilled,
        percentageOfTheBudget: goal.percentageOfTheBudget,
        amounts: goal.amounts,
        namesTrans: goal.namesTrans,
        dates: goal.dates,
        iconCode: goal.iconCode,
      );

      await box.put(goalKey, updatedGoal);
    } else {
      throw Exception('Goal not found in Hive box');
    }
  }

  @override
  Future<void> updatePercentageOfTheBudget(
      Goals goal, double newPercentage) async {
    var box = Hive.box<Goals>(boxInitName);

    final goalKey = box.keys.firstWhere(
      (key) {
        final storedGoal = box.get(key);
        return storedGoal != null && storedGoal.nameGoals == goal.nameGoals;
      },
      orElse: () => null,
    );

    if (goalKey != null) {
      final updatedGoal = Goals(
        nameGoals: goal.nameGoals,
        goalsAmount: goal.goalsAmount,
        spentAmount: goal.spentAmount,
        goalsFilled: goal.goalsFilled,
        percentageOfTheBudget: newPercentage,
        amounts: goal.amounts,
        namesTrans: goal.namesTrans,
        dates: goal.dates,
        iconCode: goal.iconCode,
      );

      await box.put(goalKey, updatedGoal);
    } else {
      throw Exception('Goal not found in Hive box');
    }
  }

  @override
  Future<List<Goals>> getGoalsWithPercentageOfTheBudget() async {
    var box = Hive.box<Goals>('goals_box');

    return box.values
        .where((goal) => goal.percentageOfTheBudget != null)
        .toList();
  }

  @override
  Future<void> removeTransactionFromGoal({
    required Goals goal,
    required int index,
  }) async {
    var box = Hive.box<Goals>(boxInitName);

    final goalKey = box.keys.firstWhere(
      (key) {
        final storedGoal = box.get(key);
        return storedGoal != null && storedGoal.nameGoals == goal.nameGoals;
      },
      orElse: () => null,
    );

    if (goalKey != null) {
      final updatedAmounts = List<double>.from(goal.amounts)..removeAt(index);
      final updatedNamesTrans = List<String>.from(goal.namesTrans)
        ..removeAt(index);
      final updatedDates = List<DateTime>.from(goal.dates)..removeAt(index);

      final updatedArbDateNameTrans =
          List<String>.from(goal.arbDateNameTrans ?? [])..removeAt(index);

      final updatedIncomeOrExpenses =
          List<bool>.from(goal.incomeOrExpenses ?? [])..removeAt(index);

      final updatedGoal = Goals(
        nameGoals: goal.nameGoals,
        goalsAmount: goal.goalsAmount,
        spentAmount: goal.spentAmount,
        goalsFilled: goal.goalsFilled,
        percentageOfTheBudget: goal.percentageOfTheBudget,
        amounts: updatedAmounts,
        namesTrans: updatedNamesTrans,
        dates: updatedDates,
        iconCode: goal.iconCode,
        arbDateNameTrans: updatedArbDateNameTrans,
        incomeOrExpenses: updatedIncomeOrExpenses,
      );

      await box.put(goalKey, updatedGoal);
    } else {
      throw Exception('Goal not found in Hive box');
    }
  }
}
