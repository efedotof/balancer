import 'package:balancer/Theme/providers/export_providers.dart';
import 'package:balancer/generated/l10n.dart';

enum TransactionCategory { expenses, income }


enum TransactionCategoryTitle {
  // Доходы
  salary, // Зарплата
  gift, // Подарки
  investmentIncome, // Доход от инвестиций
  freelance, // Фриланс
  otherIncome, // Прочие доходы

  // Расходы
  groceries, // Продукты
  transport, // Транспорт
  entertainment, // Развлечения
  health, // Здоровье
  utilities, // Коммунальные услуги
  rent, // Аренда
  shopping, // Покупки
  education, // Образование
  travel, // Путешествия
  savings, // Накопления
  otherExpense, // Прочие расходы
}

extension TransactionCategoryTitleIncomeOrExpenses on TransactionCategory {
  String name(BuildContext context) {
    switch (this) {
      case TransactionCategory.expenses:
        return S.of(context).expenses;
      case TransactionCategory.income:
        return S.of(context).income;
    }
  }
}

  




String name(BuildContext context, String category) {
  final categoryMap = {
    'TransactionCategoryTitle.salary': S.of(context).salary,
    'TransactionCategoryTitle.gift': S.of(context).gift,
    'TransactionCategoryTitle.investmentIncome': S.of(context).investmentIncome,
    'TransactionCategoryTitle.freelance': S.of(context).freelance,
    'TransactionCategoryTitle.otherIncome': S.of(context).otherIncome,
    'TransactionCategoryTitle.groceries': S.of(context).groceries,
    'TransactionCategoryTitle.transport': S.of(context).transport,
    'TransactionCategoryTitle.entertainment': S.of(context).entertainment,
    'TransactionCategoryTitle.health': S.of(context).health,
    'TransactionCategoryTitle.utilities': S.of(context).utilities,
    'TransactionCategoryTitle.rent': S.of(context).rent,
    'TransactionCategoryTitle.shopping': S.of(context).shopping,
    'TransactionCategoryTitle.education': S.of(context).education,
    'TransactionCategoryTitle.travel': S.of(context).travel,
    'TransactionCategoryTitle.savings': S.of(context).savings,
    'TransactionCategoryTitle.otherExpense': S.of(context).otherExpense,
    'budgetAllocation': S.of(context).budgetAllocation,
    'to_the_goal':S.of(context).to_the_goal,
  };

  return categoryMap[category] ?? ''; 
}





extension TransactionCategoryTitleExtension on TransactionCategoryTitle {
  String name(BuildContext context) {
    switch (this) {
      case TransactionCategoryTitle.salary:
        return S.of(context).salary;
      case TransactionCategoryTitle.gift:
        return S.of(context).gift;
      case TransactionCategoryTitle.investmentIncome:
        return S.of(context).investmentIncome;
      case TransactionCategoryTitle.freelance:
        return S.of(context).freelance;
      case TransactionCategoryTitle.otherIncome:
        return S.of(context).otherIncome;
      case TransactionCategoryTitle.groceries:
        return S.of(context).groceries;
      case TransactionCategoryTitle.transport:
        return S.of(context).transport;
      case TransactionCategoryTitle.entertainment:
        return S.of(context).entertainment;
      case TransactionCategoryTitle.health:
        return S.of(context).health;
      case TransactionCategoryTitle.utilities:
        return S.of(context).utilities;
      case TransactionCategoryTitle.rent:
        return S.of(context).rent;
      case TransactionCategoryTitle.shopping:
        return S.of(context).shopping;
      case TransactionCategoryTitle.education:
        return S.of(context).education;
      case TransactionCategoryTitle.travel:
        return S.of(context).travel;
      case TransactionCategoryTitle.savings:
        return S.of(context).savings;
      case TransactionCategoryTitle.otherExpense:
        return S.of(context).otherExpense;
    }
  }
}



IconData getIcon(TransactionCategoryTitle category) {
  switch (category) {
    case TransactionCategoryTitle.salary:
      return Icons.account_balance_wallet;
    case TransactionCategoryTitle.gift:
      return Icons.card_giftcard;
    case TransactionCategoryTitle.investmentIncome:
      return Icons.show_chart;
    case TransactionCategoryTitle.freelance:
      return Icons.laptop;
    case TransactionCategoryTitle.otherIncome:
      return Icons.attach_money;
    case TransactionCategoryTitle.groceries:
      return Icons.shopping_cart;
    case TransactionCategoryTitle.transport:
      return Icons.directions_car;
    case TransactionCategoryTitle.entertainment:
      return Icons.movie;
    case TransactionCategoryTitle.health:
      return Icons.local_hospital;
    case TransactionCategoryTitle.utilities:
      return Icons.lightbulb;
    case TransactionCategoryTitle.rent:
      return Icons.home;
    case TransactionCategoryTitle.shopping:
      return Icons.shopping_bag;
    case TransactionCategoryTitle.education:
      return Icons.school;
    case TransactionCategoryTitle.travel:
      return Icons.flight;
    case TransactionCategoryTitle.savings:
      return Icons.savings;
    case TransactionCategoryTitle.otherExpense:
      return Icons.receipt;
  }
}

