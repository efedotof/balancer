import 'package:auto_route/auto_route.dart';
import 'package:balancer/features/home/view/goal_add/cubit/goals_cubit.dart';
import 'package:balancer/features/home/view/goal_add/providers/goals_provider.dart';
import 'package:balancer/generated/l10n.dart';
import 'package:balancer/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal_add_state.dart';
part 'goal_settings_cubit.freezed.dart';

class GoalAddCubit extends Cubit<GoalAddState> {
  GoalAddCubit() : super(GoalAddState.initial());

  String title = '';
  double amount = 0.0;
  IconData icon = Icons.abc;
  GoalMode mode = GoalMode.manual;
  double? percentage;
  int codes = 0;

  void updateTitle(String newTitle) {
    title = newTitle;
    _validateForm();
  }

  void updateAmount(double newAmount) {
    amount = newAmount;
    _validateForm();
  }

  void updateIcon(IconData newIcon) {
    icon = newIcon;
    codes = newIcon.codePoint;
    debugPrint(codes.toString());
    emit(state.copyWith(icon: icon));
  }

  void updateMode(GoalMode newMode) {
    mode = newMode;
    if (mode == GoalMode.manual) {
      percentage = null;
    }
    _validateForm();
    emit(state.copyWith(mode: mode, percentage: percentage));
  }

 void updatePercentage(double newPercentage) {
  percentage = newPercentage;
  _validateForm();
  emit(state.copyWith(percentage: percentage));
}


  void _validateForm() {
    final isValid = title.isNotEmpty &&
        amount > 0 &&
        (mode == GoalMode.manual || (percentage != null && percentage! > 0));

    emit(state.copyWith(isValid: isValid));
    debugPrint('isValid: $isValid');
  }

  void createTheBox(BuildContext context) {
    debugPrint('isValid: ${state.isValid}');
    final codes = context.read<GoalsProvider>().codes;
    final isSaves = context.read<GoalsProvider>().isSave();
    if (isSaves) {
      if (codes == 0) {
        context.read<GoalsProvider>().changeCodes(newCodes: icon.codePoint);
      }
      debugPrint('codes: ${context.read<GoalsProvider>().codes}');
      context.read<GoalsCubit>().addBox(
            title: title,
            goalsAmount: amount,
            inCode: codes,
            percentageOfBudget: context.read<GoalsProvider>().percentage != null ? (context.read<GoalsProvider>().percentage!) :null,
            spentAmount: amount,
          );
      context.read<GoalsProvider>().clear();
      context.maybePop();
      context.pushRoute(
          SuccessfullyRoute(subtitle: S.of(context).the_goal_has_been_created));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(S.of(context).itIsNecessaryToEnterDataNamePurposeAndMode)));
    
    }
  }
}
