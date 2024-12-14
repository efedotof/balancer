part of 'total_cubit.dart';

@freezed
class TotalState with _$TotalState {
  const factory TotalState.initial() = _Initial;
  const factory TotalState.changeTotal({required int total}) = _ChangeTotal;
}
