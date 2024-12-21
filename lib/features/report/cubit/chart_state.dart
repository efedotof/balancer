part of 'chart_cubit.dart';

@freezed
class ChartState with _$ChartState {
  const factory ChartState.initial() = _Initial;
  const factory ChartState.loaded({
    required Map<String, int> incomeStats,  // Обновлено с TransactionCategoryTitle на String
    required Map<String, int> expenseStats, // Обновлено с TransactionCategoryTitle на String
  }) = _Loaded;
  const factory ChartState.error(String message) = _Error;
  const factory ChartState.empty() = _Empty;
}
