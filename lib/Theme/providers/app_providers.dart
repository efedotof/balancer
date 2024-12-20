import 'export_providers.dart';

class AppProviders {
  Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    final prefs = await SharedPreferences.getInstance();

    final goalsRepository = GoalsRepository();
    final budgetRepository = BudgetRepository();
    final statisticsRepository = StatisticsRepository();
    final incomeAndExpenseRepository = IncomeAndExpenseRepository();

    await budgetRepository.initHive();
    await statisticsRepository.initHive();
    await goalsRepository.initHive();
    await incomeAndExpenseRepository.initHive();

    final themeRepository = ThemeRepository(preferences: prefs);
    final homeCubit = HomeCubit();
    final balancerCubit = BalancerCubit();

    runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(interf: themeRepository),
        ),
        BlocProvider(
          create: (context) => homeCubit,
        ),
        BlocProvider(
          create: (context) => SettingsCubit(
            prefs: prefs,
            homeCubit: homeCubit,
            balancerCubit: balancerCubit,
            budgetInterface: budgetRepository,
            statiscticsInterface: statisticsRepository,
            goalsInterface: goalsRepository,
            incomeAndExpenseInterface: incomeAndExpenseRepository,
          ),
        ),
        BlocProvider(
          create: (context) => BudgetCubit(interface: budgetRepository),
        ),
        BlocProvider(
          create: (context) => GoalsCubit(interface: goalsRepository),
        ),
        BlocProvider(
          create: (context) => GoalSettingsCubit(),
        ),
        BlocProvider(
          create: (context) => NewTransactionCubit(),
        ),
        BlocProvider(
          create: (context) => CreateTheGoalsCubit(),
        ),
        BlocProvider(
          create: (context) => TotalCubit(
              interface: budgetRepository,
              incomeAndExpenseInterface: incomeAndExpenseRepository, goalsInterface: goalsRepository),
        ),
        BlocProvider(
          create: (context) => AddRowCubit(),
        ),
        BlocProvider(
            create: (context) =>
                StatisticsCubit(interface: statisticsRepository)),
        BlocProvider(create: (context) => ReportCubit()),
         BlocProvider(
          create: (context) => AddNewTransactionsToGoalCubit(),
        ),
         BlocProvider(
          create: (context) => GoalsAddEditCubit(interface: goalsRepository),
        ),
        BlocProvider(
            create: (context) =>
                ChartCubit(interface: incomeAndExpenseRepository)),
        ChangeNotifierProvider(create: (context) => GoalsProvider()),
        ChangeNotifierProvider(create: (context) => AddNewGoalsProvider())
      ],
      child: const MyApp(),
    ));
  }
}
