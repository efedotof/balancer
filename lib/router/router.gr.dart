// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [AboutScreen]
class AboutRoute extends PageRouteInfo<void> {
  const AboutRoute({List<PageRouteInfo>? children})
      : super(
          AboutRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AboutScreen();
    },
  );
}

/// generated route for
/// [AddBudgetScreen]
class AddBudgetRoute extends PageRouteInfo<void> {
  const AddBudgetRoute({List<PageRouteInfo>? children})
      : super(
          AddBudgetRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddBudgetRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AddBudgetScreen();
    },
  );
}

/// generated route for
/// [GoalSettingsScreen]
class GoalSettingsRoute extends PageRouteInfo<void> {
  const GoalSettingsRoute({List<PageRouteInfo>? children})
      : super(
          GoalSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'GoalSettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const GoalSettingsScreen();
    },
  );
}

/// generated route for
/// [HomeMainScreen]
class HomeMainRoute extends PageRouteInfo<void> {
  const HomeMainRoute({List<PageRouteInfo>? children})
      : super(
          HomeMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeMainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeMainScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [ItemsScreen]
class ItemsRoute extends PageRouteInfo<ItemsRouteArgs> {
  ItemsRoute({
    Key? key,
    required String title,
    required String subtitle,
    List<PageRouteInfo>? children,
  }) : super(
          ItemsRoute.name,
          args: ItemsRouteArgs(
            key: key,
            title: title,
            subtitle: subtitle,
          ),
          initialChildren: children,
        );

  static const String name = 'ItemsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ItemsRouteArgs>();
      return ItemsScreen(
        key: args.key,
        title: args.title,
        subtitle: args.subtitle,
      );
    },
  );
}

class ItemsRouteArgs {
  const ItemsRouteArgs({
    this.key,
    required this.title,
    required this.subtitle,
  });

  final Key? key;

  final String title;

  final String subtitle;

  @override
  String toString() {
    return 'ItemsRouteArgs{key: $key, title: $title, subtitle: $subtitle}';
  }
}

/// generated route for
/// [NewTransactionScreen]
class NewTransactionRoute extends PageRouteInfo<void> {
  const NewTransactionRoute({List<PageRouteInfo>? children})
      : super(
          NewTransactionRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewTransactionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NewTransactionScreen();
    },
  );
}

/// generated route for
/// [ReportScreen]
class ReportRoute extends PageRouteInfo<void> {
  const ReportRoute({List<PageRouteInfo>? children})
      : super(
          ReportRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ReportScreen();
    },
  );
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsScreen();
    },
  );
}
