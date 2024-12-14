part of 'chart_cubit.dart';

@freezed
class ChartState with _$ChartState {
  const factory ChartState.initial() = _Initial;
  const factory ChartState.loaded({
    required Map<TransactionCategoryTitle, int> incomeStats,
    required Map<TransactionCategoryTitle, int> expenseStats,
  }) = _Loaded;
  const factory ChartState.error(String message) = _Error;
  const factory ChartState.empty() = _Empty;
}
