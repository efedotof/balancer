import 'package:balancer/Theme/providers/export_providers.dart';
import 'package:balancer/features/new_transaction/widget/category.dart';
import 'package:balancer/generated/l10n.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'report_state.dart';
part 'report_cubit.freezed.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit() : super(const ReportState.initial(TransactionCategory.expenses));

  void selectCategory(TransactionCategory category) {
    emit(ReportState.selected(category));
  }

  String getCategoryName(BuildContext context ,TransactionCategory category) {
    switch (category) {
      case TransactionCategory.expenses:
        return S.of(context).expenses;
      case TransactionCategory.income:
        return S.of(context).income;
    }
  }

  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd.MM.yyyy HH:mm');
    return formatter.format(date);
  }

   Map<String, double> adjustStatsToPieData(Map<TransactionCategoryTitle, int> stats) {
    return stats.map((key, value) => MapEntry(key.toString(), value.toDouble()));
  }

   Map<String, List<T>> groupByMonth<T extends dynamic>(List<T> transactions) {
    final Map<String, List<T>> grouped = {};
    for (var transaction in transactions) {
      final date = transaction.time; 
      final month = DateFormat.yMMMM().format(date);
      grouped.putIfAbsent(month, () => []).add(transaction);
    }


    final sortedKeys = grouped.keys.toList()
      ..sort((a, b) {
        final aDate = DateFormat.yMMMM().parse(a);
        final bDate = DateFormat.yMMMM().parse(b);
        return bDate.compareTo(aDate);
      });

    final sortedGrouped = {for (var key in sortedKeys) key: grouped[key]!};

    sortedGrouped.forEach((key, value) {
      value.sort((a, b) => b.time.compareTo(a.time));
    });

    return sortedGrouped;
  }


}
