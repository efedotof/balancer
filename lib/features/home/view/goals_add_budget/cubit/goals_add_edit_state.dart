part of 'goals_add_edit_cubit.dart';

@freezed
class GoalsAddEditState with _$GoalsAddEditState {
  const factory GoalsAddEditState.noEdit() = _NoEdit;
  const factory GoalsAddEditState.edit() = _Edit;
}
