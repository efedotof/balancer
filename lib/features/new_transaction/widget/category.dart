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
