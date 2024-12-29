import 'package:balancer/box/goals/repository/goals_interface.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'goals_state.dart';
part 'goals_cubit.freezed.dart';

class GoalsCubit extends Cubit<GoalsState> {
  GoalsCubit({required GoalsInterface interface})
      : _interface = interface,
        super(const GoalsState.initial());

  final GoalsInterface _interface;

  Future<void> addBox({
    required String title,
    required double goalsAmount,
    double? goalsFilled,
    double? percentageOfBudget,
    List<double>? amounts,
    List<String>? namesTrans,
    List<DateTime>? dates,
    double? spentAmount,
    required int inCode,
  }) async {
    try {
      await _interface.boxAdd(
        title,
        goalsAmount,
        goalsFilled,
        percentageOfBudget,
        amounts,
        namesTrans,
        dates,
        spentAmount,
        inCode,
      );
      debugPrint('Goals added');
    } catch (e) {
      debugPrint('Error adding goals: $e');
    }
  }
}
