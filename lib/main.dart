import 'package:balancer/Theme/providers/app_providers.dart';
import 'package:balancer/ads/ads_repository.dart';
import 'package:balancer/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Theme/providers/export_providers.dart';
import 'Theme/theme.dart';
import 'router/router.dart';


void main() async {
final appProviders = AppProviders();
  await appProviders.initialize();
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
          locale: Locale(context.watch<LanguageCubit>().checkLocale()),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          theme: state.isDark ? lightTheme : dartTheme,
          routerConfig: _appRouter.config(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
