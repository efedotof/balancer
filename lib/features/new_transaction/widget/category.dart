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

extension TransactionCategoryTitleExtension on TransactionCategoryTitle {
  String get name {
    switch (this) {
      case TransactionCategoryTitle.salary:
        return 'Salary';
      case TransactionCategoryTitle.gift:
        return 'Gift';
      case TransactionCategoryTitle.investmentIncome:
        return 'Investment Income';
      case TransactionCategoryTitle.freelance:
        return 'Freelance';
      case TransactionCategoryTitle.otherIncome:
        return 'Other Income';
      case TransactionCategoryTitle.groceries:
        return 'Groceries';
      case TransactionCategoryTitle.transport:
        return 'Transport';
      case TransactionCategoryTitle.entertainment:
        return 'Entertainment';
      case TransactionCategoryTitle.health:
        return 'Health';
      case TransactionCategoryTitle.utilities:
        return 'Utilities';
      case TransactionCategoryTitle.rent:
        return 'Rent';
      case TransactionCategoryTitle.shopping:
        return 'Shopping';
      case TransactionCategoryTitle.education:
        return 'Education';
      case TransactionCategoryTitle.travel:
        return 'Travel';
      case TransactionCategoryTitle.savings:
        return 'Savings';
      case TransactionCategoryTitle.otherExpense:
        return 'Other Expense';
    }
  }
}
