part of 'report_cubit.dart';

sealed class ReportState extends Equatable {
  const ReportState();

  @override
  List<Object> get props => [];
}

final class ReportInitial extends ReportState {}

final class ReportUpdated extends ReportState {
  final List<Transaction> transactions;
  final Map<String, double> categoryTotals;
  final double totalAmount;

  const ReportUpdated(this.transactions, this.categoryTotals, this.totalAmount);

  @override
  List<Object> get props => [transactions, categoryTotals, totalAmount];
}

final class IncomeExpenseToggled extends ReportState {
  final bool isIncome;
  
  const IncomeExpenseToggled(this.isIncome);

  @override
  List<Object> get props => [isIncome];
}