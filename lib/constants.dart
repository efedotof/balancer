

import 'package:balancer/router/router.dart';
import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xFF1F1F1F);
  static const white = Colors.white;
}

class AppTextStyles {
  static const appBarTitle = TextStyle(color: AppColors.white);
  static const emptyTransactions = TextStyle(fontSize: 18, color: Colors.grey);
}


class AppIcons{
 static const  List<Widget> iconList = [
       Icon(Icons.home_outlined),
       Icon(Icons.bar_chart_outlined),
       Icon(Icons.settings),

    ];
}

class AppNavigationScreen{
  static const navigationScreen = [
        HomeRoute(),
        ReportRoute(),
        SettingsRoute()
      ];
}

class AppStrings {
  static const appBarTitleHome = 'Управление';
  static const appBarTitleSetting = 'Настройки';
  static const noTransactions = 'Транзакций нет';
  static const filterNames = ['Все', 'Сегодня', 'Вчера', 'Последняя неделя'];
  static const dropDownNames = <String>[
                            'Другое',
                            'Еда',
                            'Транспорт',
                            'Отели',
                            'Одежда, обувь',
                            'Супермаркеты',
                            'Рестораны',
                            'Сервис, услуги',
                            'Развлечения',
                            'Цифровые товары',
                            'Финансовые услуги',
                            'Авиабилеты',
                            'Косметика и бытовые товары',
                            'Зарплата',
                            'Иной доход'
                          ];
}

class AppSizes {
  static const double padding = 16.0;
  static const double cardSpacing = 20.0;
}

