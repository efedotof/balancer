import 'package:auto_route/auto_route.dart';
import 'package:balancer/Theme/providers/export_providers.dart';
import 'package:balancer/box/budget/repository/budget_interface.dart';
import 'package:balancer/box/goals/repository/goals_interface.dart';
import 'package:balancer/box/incomeAndExpense/repository/income_and_expense_interface.dart';
import 'package:balancer/box/statistics/repository/statistics_interface.dart';
import 'package:balancer/generated/l10n.dart';
import 'package:balancer/router/router.dart';
import 'package:equatable/equatable.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({
    required BudgetInterface budgetInterface,
    required StatisticsInterface statiscticsInterface,
    required GoalsInterface goalsInterface,
    required IncomeAndExpenseInterface incomeAndExpenseInterface,
    required this.prefs,
    required this.homeCubit,
    required this.balancerCubit,
  })  : _incomeAndExpenseInterface = incomeAndExpenseInterface,
        _goalsInterface = goalsInterface,
        _statiscticsInterface = statiscticsInterface,
        _budgetInterface = budgetInterface,
        super(SettingsInitial());

  final SharedPreferences prefs;
  final HomeCubit homeCubit;
  final BalancerCubit balancerCubit;
  final BudgetInterface _budgetInterface;
  final StatisticsInterface _statiscticsInterface;
  final GoalsInterface _goalsInterface;
  final IncomeAndExpenseInterface _incomeAndExpenseInterface;

  void _clearAppCash(BuildContext context) async {
    try {
      await _removeAllBoxes();
      if (context.mounted) {
        context.read<BudgetCubit>().getBudget();
        context.read<StatisticsCubit>().getStatistics();
        context.read<ChartCubit>().getStatisticsToPie();
      }
      if (context.mounted) {
        context.maybePop();
      }
      if (context.mounted) {
        context.pushRoute(
            SuccessfullyRoute(subtitle: S.of(context).allDataHasBeenDeleted));
      }
    } catch (e) {
      debugPrint('Error while clearing data: $e');
    }
  }

  Future<void> _removeAllBoxes() async {
    await Future.wait([
      _budgetInterface.removeAllBox(),
      _statiscticsInterface.removeAllBox(),
      _goalsInterface.removeAllBox(),
      _incomeAndExpenseInterface.removeAllBox(),
    ]);
  }

  void clearAll(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).confirmDeletion),
          content: Text(
              S.of(context).warningIfYouDeleteAllDataEverythingWillBeRemoved),
          actions: <Widget>[
            TextButton(
              onPressed: () => context.maybePop(),
              child: Text(S.of(context).cancel),
            ),
            TextButton(
              onPressed: () {
                _clearAppCash(context);
              },
              child: Text(S.of(context).delete),
            ),
          ],
        );
      },
    );
  }

  void pushAbout(BuildContext context) {
    context.pushRoute(const AboutRoute());
  }

 void selectLanguage(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              S.of(context).language,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.language),
              title:  Text(S.of(context).russian),
              onTap: () {
                context.read<LanguageCubit>().setLocale('ru');

                context.maybePop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title:  Text(S.of(context).english),
              onTap: () {
                context.read<LanguageCubit>().setLocale('en');
                context.maybePop();
              },
            ),
          ],
        ),
      );
    },
  );
}


}
