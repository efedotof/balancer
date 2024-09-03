import 'package:auto_route/auto_route.dart';
import 'package:balancer/constants.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeMainScreen extends StatelessWidget {
  const HomeMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: AppNavigationScreen.navigationScreen,
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              tabsRouter.setActiveIndex(index);
            },
            items: List.generate(
                AppIcons.iconList.length,
                (index) => BottomNavigationBarItem(
                      icon: AppIcons.iconList[index],
                      label: '',
                    )),
          ),
        );
      },
    );
  }
}