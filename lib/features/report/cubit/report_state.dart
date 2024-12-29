part of 'report_cubit.dart';

@freezed
class ReportState with _$ReportState {
  const factory ReportState.initial(TransactionCategory category) = _Initial;
  const factory ReportState.selected(TransactionCategory category) = _Selected;

}
