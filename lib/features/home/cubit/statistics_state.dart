part of 'statistics_cubit.dart';

@freezed
class StatisticsState with _$StatisticsState {
  const factory StatisticsState.initial() = _Initial;
  const factory StatisticsState.empty() = _Empty;
  const factory StatisticsState.notEmpty({required double amountExpense, required double amountIncome}) = _NotEmpty;
  const factory StatisticsState.uploadStatistics({required double amountExpense, required double amountIncome}) = _UploadStatistics;

}
