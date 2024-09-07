import 'package:auto_route/auto_route.dart';

import '../features/home/home.dart';
import '../features/main_home/main_home.dart';
import '../features/settings/profile.dart';
import '../features/report/report.dart';


part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeMainRoute.page, path: '/', children: [
          AutoRoute(page: HomeRoute.page, path: 'home'),
          AutoRoute(page: ReportRoute.page, path: 'report'),
          AutoRoute(page: SettingsRoute.page, path: 'profile'),
        ]),
      ];
}
