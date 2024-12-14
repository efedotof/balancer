import 'package:balancer/features/new_transaction/widget/category.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'report_state.dart';
part 'report_cubit.freezed.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit() : super(const ReportState.initial(TransactionCategory.expenses));

  void selectCategory(TransactionCategory category) {
    emit(ReportState.selected(category));
  }

  String getCategoryName(TransactionCategory category) {
    switch (category) {
      case TransactionCategory.expenses:
        return 'Expenses';
      case TransactionCategory.income:
        return 'Income';
    }
  }

  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd.MM.yyyy HH:mm');
    return formatter.format(date);
  }

   Map<String, double> adjustStatsToPieData(Map<TransactionCategoryTitle, int> stats) {
    return stats.map((key, value) => MapEntry(key.toString(), value.toDouble()));
  }

}
