import 'package:balancer/features/home/provider/budget_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'items_to_budget_state.dart';
part 'items_to_budget_cubit.freezed.dart';

class ItemsToBudgetCubit extends Cubit<ItemsToBudgetState> {
  ItemsToBudgetCubit({required this.controller})
      : super(ItemsToBudgetState.initial(controller: controller));

  final TextEditingController controller;

  

  Future<void> setEmit(
    BuildContext context, {
    required int index,
    required TextEditingController controller,
  }) async {
    try {

       switch (index) {
        case 1:
          // emit(const ItemsToBudgetState.twoPage());
          double budget = double.parse(controller.text);
          emit(ItemsToBudgetState.threePage(budget: budget, selected: 0));
          context.read<BudgetProvider>().changeIsLast();
          break;
          // break;
        // case 2:
          // double budget = double.parse(controller.text);
          // emit(ItemsToBudgetState.threePage(budget: budget, selected: 0));
          // break;
      }
     
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  double calculateProgress(double spent, double goalAmount) {
    if (goalAmount == 0) return 0;
    debugPrint('progressDouble: ${spent / goalAmount}');
    return spent / goalAmount;
  }

  void updateSelectedValue(double value) {
    final currentState = state;
    if (currentState is _ThreePage) {
      emit(currentState.copyWith(selected: value));
    }
  }
}
