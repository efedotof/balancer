part of 'goal_add_cubit.dart';

@freezed
class GoalAddState with _$GoalSettingsState {
  const factory GoalAddState({
    required String title,
    required double amount,
    required IconData icon,
    required GoalMode mode,
    required double? percentage,
    required int codes,
    @Default(false) bool isValid,
  }) = _GoalSettingsState;

  factory GoalAddState.initial() => const GoalAddState(
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