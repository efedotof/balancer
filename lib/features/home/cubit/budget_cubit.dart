import 'package:balancer/box/budget/budget.dart';
import 'package:balancer/box/budget/repository/budget_interface.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'budget_state.dart';
part 'budget_cubit.freezed.dart';

class BudgetCubit extends Cubit<BudgetState> {
  BudgetCubit({required BudgetInterface interface}) : _interface = interface, super(const BudgetState.initial()){
    getBudget();
  }


  final BudgetInterface _interface;

  Future<void> getBudget() async{
    try {
      final box = Hive.box<Budget>('Budget_box');
      if(box.isEmpty){
        emit(const BudgetState.empty());
      }else{
        final budget =  box.getAt(0);
        if(budget != null){
        emit( BudgetState.isNotEmpty(budgetAmount: budget.amountBudget, spent: budget.spent, left: budget.left));
        }else{
          debugPrint('error');
        }  
      }
    } catch (e) {
      debugPrint('error budget: $e');
    }
  }

  Future<void> addBudget({required int amountBudget, required int? spent, required int? left}) async{
    try {
      _interface.boxAdd(amountBudget, spent, left);
    } catch (e) {
      debugPrint('error to add budget: $e');
    }
  }
}
