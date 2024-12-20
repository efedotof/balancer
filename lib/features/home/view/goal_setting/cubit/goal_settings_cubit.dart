

import 'package:auto_route/auto_route.dart';
import 'package:balancer/features/home/view/goal_setting/cubit/goals_cubit.dart';
import 'package:balancer/features/home/view/goal_setting/providers/goals_provider.dart';
import 'package:balancer/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal_settings_state.dart';
part 'goal_settings_cubit.freezed.dart';

class GoalSettingsCubit extends Cubit<GoalSettingsState> {
  GoalSettingsCubit() : super(GoalSettingsState.initial());

  // Поля для отслеживания значений
  String title = '';
  double amount = 0.0;
  IconData icon = Icons.abc;
  GoalMode mode = GoalMode.manual;
  double? percentage;
  int codes = 0;

  // Метод обновления заголовка
  void updateTitle(String newTitle) {
    title = newTitle;
    _validateForm(); // Проверка валидности уже обновляет состояние
  }

  // Обновление суммы
  void updateAmount(double newAmount) {
    amount = newAmount;
    _validateForm();
  }

  // Обновление иконки
  void updateIcon(IconData newIcon) {
    icon = newIcon;
    codes = newIcon.codePoint;
    debugPrint(codes.toString());
    emit(state.copyWith(icon: icon));
  }

  // Обновление режима
  void updateMode(GoalMode newMode) {
    mode = newMode;
    if (mode == GoalMode.manual) {
      percentage = null;
    }
    _validateForm();
  }

  void updatePercentage(double newPercentage) {
    percentage = newPercentage;
    _validateForm();
  }

  void _validateForm() {
    final isValid = title.isNotEmpty &&
        amount > 0 &&
        (mode == GoalMode.manual || (percentage != null && percentage! > 0));

    emit(state.copyWith(isValid: isValid));
    debugPrint('isValid: $isValid');
  }

  // Создание новой цели
  void createTheBox(BuildContext context) {
  debugPrint('isValid: ${state.isValid}');
  final codes = context.read<GoalsProvider>().codes; // Получаем значение из GoalsProvider
  if (state.isValid) {
    if (codes == 0) {
      context.read<GoalsProvider>().changeCodes(newCodes: icon.codePoint); // Обновляем codes в GoalsProvider
    }
    debugPrint('codes: ${context.read<GoalsProvider>().codes}');
    context.read<GoalsCubit>().addBox(
      title: title,
      goalsAmount: amount.toInt(),
      inCode: codes,
    );
    context.maybePop();
    context.pushRoute( SuccessfullyRoute(subtitle: 'Цель создана'));
  }
}


}
