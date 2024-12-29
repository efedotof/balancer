part of 'chart_cubit.dart';

@freezed
class ChartState with _$ChartState {
  const factory ChartState.initial() = _Initial;
  const factory ChartState.loaded({
    required Map<String, double> incomeStats, 
    required Map<String, double> expenseStats,
  }) = _Loaded;
  const factory ChartState.error(String message) = _Error;
  const factory ChartState.empty() = _Empty;
}
