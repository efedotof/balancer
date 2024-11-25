part of 'statistics_cubit.dart';

@freezed
class StatisticsState with _$StatisticsState {
  const factory StatisticsState.initial() = _Initial;
  const factory StatisticsState.empty() = _Empty;
  const factory StatisticsState.notEmpty({required int amountExpense, required int amountIncome}) = _NotEmpty;
  const factory StatisticsState.uploadStatistics({required int amountExpense, required int amountIncome}) = _UploadStatistics;

}
