part of 'goal_settings_cubit.dart';

@freezed
class GoalSettingsState with _$GoalSettingsState {
  const factory GoalSettingsState({
    required String title,
    required double amount,
    required IconData icon,
    required GoalMode mode,
    required double? percentage,
    required int codes,
    @Default(false) bool isValid,
  }) = _GoalSettingsState;

  factory GoalSettingsState.initial() => const GoalSettingsState(
        title: '',
        amount: 0,
        icon: Icons.abc,
        mode: GoalMode.manual,
        percentage: null,
        isValid: false,
        codes: 984246,
      );
}

enum GoalMode { manual, percentage }