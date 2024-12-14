import 'package:balancer/box/goals/repository/goals_interface.dart';
import 'package:balancer/box/models/transactions.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'goals_state.dart';
part 'goals_cubit.freezed.dart';

class GoalsCubit extends Cubit<GoalsState> {
  GoalsCubit({required GoalsInterface interface}) : _interface = interface, super(const GoalsState.initial());

  final GoalsInterface _interface;

  Future<void> addBox({required String title, required int goalsAmount, int? goalsFilled, int? percentageOfBudget, List<Transactions>? transactions, int? spentAmount, required int inCode}) async{
    try {
      _interface.boxAdd(title,  goalsAmount, goalsFilled,  percentageOfBudget,  transactions, spentAmount, inCode);
      debugPrint('goals add');
    } catch (e) {
      debugPrint('error goals add: $e');
    }
  }
  

  Future<void> deleateBox({required int index}) async {
    try {
      _interface.removeBox(index);
    } catch (e) {
      debugPrint('error to delate goalsBox: $e');
    }
  
  }




}
