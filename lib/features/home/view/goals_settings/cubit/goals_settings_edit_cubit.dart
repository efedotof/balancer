import 'package:auto_route/auto_route.dart';
import 'package:balancer/box/goals/goals.dart';
import 'package:balancer/box/goals/repository/goals_interface.dart';
import 'package:balancer/generated/l10n.dart';
import 'package:balancer/router/router.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'goals_settings_edit_state.dart';
part 'goals_settings_edit_cubit.freezed.dart';

class GoalsSettingsEditCubit extends Cubit<GoalsSettingsEditState> {
  GoalsSettingsEditCubit({required GoalsInterface interface})
      : _interface = interface,
        super(const GoalsSettingsEditState.noEdit());

  final GoalsInterface _interface;

  void toggleEditMode({required bool isEditing}) {
    emit(isEditing
        ? const GoalsSettingsEditState.edit()
        : const GoalsSettingsEditState.noEdit());
  }

  void uploadName({required Goals goal, required String newName}) {
    _interface.updateGoalName(goal, newName);
  }

  void uploadAmount({required Goals goal, required double newAmount}) {
    _interface.updateGoalAmount(goal, newAmount);
  }

Future<void> saveGoalChanges(BuildContext context, {
  required Goals goal,
  required String newName,
  required double newAmount,
  required double newPercentage, 
}) async {
  bool isUpdated = false;

  try {
    if (newName.isNotEmpty && newName != goal.nameGoals && newAmount > 0 && newAmount != goal.goalsAmount) {
      await _interface.updateGoalAmountAndName(goal, newAmount, newName);
      isUpdated = true;
    } else {
      if (newName.isNotEmpty && newName != goal.nameGoals) {
        await _interface.updateGoalName(goal, newName);
        isUpdated = true;
      }
      
      if (newAmount > 0 && newAmount != goal.goalsAmount) {
        await _interface.updateGoalAmount(goal, newAmount);
        isUpdated = true;
      }
    }

    if (newPercentage != goal.percentageOfTheBudget) {
      await _interface.updatePercentageOfTheBudget(goal, newPercentage);
      isUpdated = true;
    }

    toggleEditMode(isEditing: false);

    if (isUpdated && context.mounted) {
      context.maybePop();
      context.pushRoute(SuccessfullyRoute(subtitle: S.of(context).the_goal_has_been_updated));
    }
  } catch (error) {
    debugPrint('Error saving goal changes: $error');
  }
}

  Future<void> deleateToGoals(BuildContext context, {required Goals goals}) async {
    _interface.removeBox(goals);
    context.maybePop();
    context.pushRoute(SuccessfullyRoute(subtitle: S.of(context).goalDeleted));
  }


  Future<void> deleateToTransToGoals({required Goals goal, required BuildContext context, required int index}) async {
    try {
      _interface.removeTransactionFromGoal(goal: goal, index: index);
    } catch (e) {
      debugPrint('error $e');
    }
  
  }



}
