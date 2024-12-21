import 'package:auto_route/auto_route.dart';
import 'package:balancer/box/goals/goals.dart';
import 'package:balancer/box/goals/repository/goals_interface.dart';
import 'package:balancer/generated/l10n.dart';
import 'package:balancer/router/router.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'goals_add_edit_state.dart';
part 'goals_add_edit_cubit.freezed.dart';

class GoalsAddEditCubit extends Cubit<GoalsAddEditState> {
  GoalsAddEditCubit({required GoalsInterface interface})
      : _interface = interface,
        super(const GoalsAddEditState.noEdit());

  final GoalsInterface _interface;

  void toggleEditMode({required bool isEditing}) {
    emit(isEditing
        ? const GoalsAddEditState.edit()
        : const GoalsAddEditState.noEdit());
  }

  void uploadName({required Goals goal, required String newName}) {
    _interface.updateGoalName(goal, newName);
  }

  void uploadAmount({required Goals goal, required int newAmount}) {
    _interface.updateGoalAmount(goal, newAmount);
  }

Future<void> saveGoalChanges(BuildContext context, {
  required Goals goal,
  required String newName,
  required int newAmount,
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

    toggleEditMode(isEditing: false);

    if (isUpdated && context.mounted) {
      context.maybePop();
      context.pushRoute(SuccessfullyRoute(subtitle: S.of(context).the_goal_has_been_updated));
    }
  } catch (error) {
    debugPrint('Error saving goal changes: $error');
  }
}

}
