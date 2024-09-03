import 'package:balancer/ads/ads_repository.dart';
import 'package:balancer/box/repository/box_repository.dart';
import 'package:balancer/features/home/cubit/home_cubit.dart';
import 'package:balancer/features/home/repository/home_repository.dart';
import 'package:balancer/features/report/cubit/report_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Theme/cubit/theme_cubit.dart';
import 'Theme/repositories/theme_settings.dart';
import 'Theme/theme.dart';
import 'features/home/cubit/balancer_cubit.dart';
import 'features/settings/cubit/settings_cubit.dart';
import 'router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final prefs = await SharedPreferences.getInstance();

  final boxRepository = BoxRepository();
  await boxRepository.initHive();

  final themeRepository = ThemeRepository(preferences: prefs);
  final homeRepository = HomeRepository(preferences: prefs, boxInterface: boxRepository);
  final homeCubit = HomeCubit(interface: homeRepository);
  final balancerCubit = BalancerCubit(interface: homeRepository);

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
          boxInterface: boxRepository,
          prefs: prefs,
          homeCubit: homeCubit,
          balancerCubit: balancerCubit,
        ),
      ),

      BlocProvider(
        create: (context) => ReportCubit(),
      ),

      BlocProvider(
        create: (context) => balancerCubit,
      ),
      
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final _appRouter = AppRouter();
  final AdsRepository _rep = AdsRepository();

  @override
  void initState() {
    super.initState();
    _rep.initAds();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _rep.didChangeAppLifecycleState(state);
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          theme: state.isDark ? lightTheme : dartTheme,
          routerConfig: _appRouter.config(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
