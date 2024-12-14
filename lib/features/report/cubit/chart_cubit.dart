import 'package:balancer/box/incomeAndExpense/repository/income_and_expense_interface.dart';
import 'package:balancer/features/new_transaction/widget/category.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chart_state.dart';
part 'chart_cubit.freezed.dart';

class ChartCubit extends Cubit<ChartState> {
  ChartCubit({required IncomeAndExpenseInterface interface})
      : _interface = interface,
        super(const ChartState.initial());

  final IncomeAndExpenseInterface _interface;

  void getStatisticsToPie() async {
    try {
      final incomeStats = await _interface.getIncomeStats();
      final expenseStats = await _interface.getExpenseStats();
      final adjustedIncomeStats = _adjustCategoryStats(incomeStats, 'income');
      final adjustedExpenseStats = _adjustCategoryStats(expenseStats, 'expenses');

      emit(ChartState.loaded(
        incomeStats: adjustedIncomeStats,
        expenseStats: adjustedExpenseStats,
      ));
    } catch (e) {
      emit(ChartState.error(e.toString()));
    }
  }

  Map<TransactionCategoryTitle, int> _adjustCategoryStats(
      Map<TransactionCategoryTitle, int> stats, String category) {
    Map<TransactionCategoryTitle, int> adjustedStats = {};

    stats.forEach((categoryTitle, amount) {
      if (category == 'income') {

        adjustedStats[categoryTitle] = amount; 
      } else if (category == 'expenses') {

        adjustedStats[categoryTitle] = amount; 
      }
    });

    return adjustedStats;
  }
}
