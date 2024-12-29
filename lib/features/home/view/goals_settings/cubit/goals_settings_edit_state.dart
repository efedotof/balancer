part of 'goals_settings_edit_cubit.dart';

@freezed
class GoalsSettingsEditState with _$GoalsSettingsEditState {
  const factory GoalsSettingsEditState.noEdit() = _NoEdit;
  const factory GoalsSettingsEditState.edit() = _Edit;
}
