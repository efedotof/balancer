// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Create a New Transaction`
  String get newTransaction {
    return Intl.message(
      'Create a New Transaction',
      name: 'newTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Add a New Row`
  String get addNewRow {
    return Intl.message(
      'Add a New Row',
      name: 'addNewRow',
      desc: '',
      args: [],
    );
  }

  /// `Add New Transactions to Your Goals`
  String get addNewTransactionsToGoals {
    return Intl.message(
      'Add New Transactions to Your Goals',
      name: 'addNewTransactionsToGoals',
      desc: '',
      args: [],
    );
  }

  /// `Salary`
  String get salary {
    return Intl.message(
      'Salary',
      name: 'salary',
      desc: '',
      args: [],
    );
  }

  /// `Gift`
  String get gift {
    return Intl.message(
      'Gift',
      name: 'gift',
      desc: '',
      args: [],
    );
  }

  /// `Investment Income`
  String get investmentIncome {
    return Intl.message(
      'Investment Income',
      name: 'investmentIncome',
      desc: '',
      args: [],
    );
  }

  /// `Freelance Work`
  String get freelance {
    return Intl.message(
      'Freelance Work',
      name: 'freelance',
      desc: '',
      args: [],
    );
  }

  /// `Other Sources of Income`
  String get otherIncome {
    return Intl.message(
      'Other Sources of Income',
      name: 'otherIncome',
      desc: '',
      args: [],
    );
  }

  /// `Groceries`
  String get groceries {
    return Intl.message(
      'Groceries',
      name: 'groceries',
      desc: '',
      args: [],
    );
  }

  /// `Transportation`
  String get transport {
    return Intl.message(
      'Transportation',
      name: 'transport',
      desc: '',
      args: [],
    );
  }

  /// `Entertainment`
  String get entertainment {
    return Intl.message(
      'Entertainment',
      name: 'entertainment',
      desc: '',
      args: [],
    );
  }

  /// `Healthcare`
  String get health {
    return Intl.message(
      'Healthcare',
      name: 'health',
      desc: '',
      args: [],
    );
  }

  /// `Utilities`
  String get utilities {
    return Intl.message(
      'Utilities',
      name: 'utilities',
      desc: '',
      args: [],
    );
  }

  /// `Rent`
  String get rent {
    return Intl.message(
      'Rent',
      name: 'rent',
      desc: '',
      args: [],
    );
  }

  /// `Shopping`
  String get shopping {
    return Intl.message(
      'Shopping',
      name: 'shopping',
      desc: '',
      args: [],
    );
  }

  /// `Education`
  String get education {
    return Intl.message(
      'Education',
      name: 'education',
      desc: '',
      args: [],
    );
  }

  /// `Travel`
  String get travel {
    return Intl.message(
      'Travel',
      name: 'travel',
      desc: '',
      args: [],
    );
  }

  /// `Savings`
  String get savings {
    return Intl.message(
      'Savings',
      name: 'savings',
      desc: '',
      args: [],
    );
  }

  /// `Other Expenses`
  String get otherExpense {
    return Intl.message(
      'Other Expenses',
      name: 'otherExpense',
      desc: '',
      args: [],
    );
  }

  /// `Report`
  String get reply {
    return Intl.message(
      'Report',
      name: 'reply',
      desc: '',
      args: [],
    );
  }

  /// `No income recorded`
  String get there_is_no_income {
    return Intl.message(
      'No income recorded',
      name: 'there_is_no_income',
      desc: '',
      args: [],
    );
  }

  /// `No expenses recorded`
  String get t_no {
    return Intl.message(
      'No expenses recorded',
      name: 't_no',
      desc: '',
      args: [],
    );
  }

  /// `Whoa...you...`
  String get uhhh_you {
    return Intl.message(
      'Whoa...you...',
      name: 'uhhh_you',
      desc: '',
      args: [],
    );
  }

  /// `Add New Goals`
  String get addNewGoals {
    return Intl.message(
      'Add New Goals',
      name: 'addNewGoals',
      desc: '',
      args: [],
    );
  }

  /// `Monthly Budget`
  String get monthlyBudget {
    return Intl.message(
      'Monthly Budget',
      name: 'monthlyBudget',
      desc: '',
      args: [],
    );
  }

  /// `Spent`
  String get spent {
    return Intl.message(
      'Spent',
      name: 'spent',
      desc: '',
      args: [],
    );
  }

  /// `Remaining`
  String get left {
    return Intl.message(
      'Remaining',
      name: 'left',
      desc: '',
      args: [],
    );
  }

  /// `Set Your Monthly Budget`
  String get determine_your_monthly_budget {
    return Intl.message(
      'Set Your Monthly Budget',
      name: 'determine_your_monthly_budget',
      desc: '',
      args: [],
    );
  }

  /// `+/- Amount*`
  String get plus_or_minus_amount {
    return Intl.message(
      '+/- Amount*',
      name: 'plus_or_minus_amount',
      desc: '',
      args: [],
    );
  }

  /// `Select a Category*`
  String get select_category {
    return Intl.message(
      'Select a Category*',
      name: 'select_category',
      desc: '',
      args: [],
    );
  }

  /// `Add a New Transaction`
  String get add_new_transaction {
    return Intl.message(
      'Add a New Transaction',
      name: 'add_new_transaction',
      desc: '',
      args: [],
    );
  }

  /// `Set Your Saving Goals`
  String get addYourSavingGoals {
    return Intl.message(
      'Set Your Saving Goals',
      name: 'addYourSavingGoals',
      desc: '',
      args: [],
    );
  }

  /// `Statistics`
  String get statistics {
    return Intl.message(
      'Statistics',
      name: 'statistics',
      desc: '',
      args: [],
    );
  }

  /// `Expenses`
  String get expense {
    return Intl.message(
      'Expenses',
      name: 'expense',
      desc: '',
      args: [],
    );
  }

  /// `Income`
  String get income {
    return Intl.message(
      'Income',
      name: 'income',
      desc: '',
      args: [],
    );
  }

  /// `What’s Your Monthly Income?`
  String get whatsYourMonthlyIncome {
    return Intl.message(
      'What’s Your Monthly Income?',
      name: 'whatsYourMonthlyIncome',
      desc: '',
      args: [],
    );
  }

  /// `Enter or adjust the income received last month.`
  String get valueForTheIncomeReceivedInThePreviousMonthYou {
    return Intl.message(
      'Enter or adjust the income received last month.',
      name: 'valueForTheIncomeReceivedInThePreviousMonthYou',
      desc: '',
      args: [],
    );
  }

  /// `How Much Would You Like to Spend Each Month?`
  String get howMuchDoYouWantToSpendMonthly {
    return Intl.message(
      'How Much Would You Like to Spend Each Month?',
      name: 'howMuchDoYouWantToSpendMonthly',
      desc: '',
      args: [],
    );
  }

  /// `We suggest keeping your monthly expenses under 80% of your income, but you can set your own limit.`
  String get weSuggesThatYourMonthlyExpensesDoNotExceed80 {
    return Intl.message(
      'We suggest keeping your monthly expenses under 80% of your income, but you can set your own limit.',
      name: 'weSuggesThatYourMonthlyExpensesDoNotExceed80',
      desc: '',
      args: [],
    );
  }

  /// `Budget Added`
  String get budget_added {
    return Intl.message(
      'Budget Added',
      name: 'budget_added',
      desc: '',
      args: [],
    );
  }

  /// `The value must be greater than zero!`
  String get the_value_must_be_greater_than_zero {
    return Intl.message(
      'The value must be greater than zero!',
      name: 'the_value_must_be_greater_than_zero',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Selected:`
  String get selected {
    return Intl.message(
      'Selected:',
      name: 'selected',
      desc: '',
      args: [],
    );
  }

  /// `of`
  String get from {
    return Intl.message(
      'of',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `Select an Icon:`
  String get selectIcon {
    return Intl.message(
      'Select an Icon:',
      name: 'selectIcon',
      desc: '',
      args: [],
    );
  }

  /// `Goal Settings`
  String get goalSettings {
    return Intl.message(
      'Goal Settings',
      name: 'goalSettings',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get to_create {
    return Intl.message(
      'Create',
      name: 'to_create',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid amount.`
  String get pleaseEnterAValidAmount {
    return Intl.message(
      'Please enter a valid amount.',
      name: 'pleaseEnterAValidAmount',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Percentage`
  String get percentage {
    return Intl.message(
      'Percentage',
      name: 'percentage',
      desc: '',
      args: [],
    );
  }

  /// `Manual`
  String get manual {
    return Intl.message(
      'Manual',
      name: 'manual',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Goal Name`
  String get goalName {
    return Intl.message(
      'Goal Name',
      name: 'goalName',
      desc: '',
      args: [],
    );
  }

  /// `Goal Amount (₽)`
  String get goalAmount {
    return Intl.message(
      'Goal Amount (₽)',
      name: 'goalAmount',
      desc: '',
      args: [],
    );
  }

  /// `Filled`
  String get filled {
    return Intl.message(
      'Filled',
      name: 'filled',
      desc: '',
      args: [],
    );
  }

  /// `Transactions`
  String get transactions {
    return Intl.message(
      'Transactions',
      name: 'transactions',
      desc: '',
      args: [],
    );
  }

  /// `No transactions recorded yet`
  String get thereHaveBeenNoOperationsYet {
    return Intl.message(
      'No transactions recorded yet',
      name: 'thereHaveBeenNoOperationsYet',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Goal Updated`
  String get the_goal_has_been_updated {
    return Intl.message(
      'Goal Updated',
      name: 'the_goal_has_been_updated',
      desc: '',
      args: [],
    );
  }

  /// `Goal Created`
  String get the_goal_has_been_created {
    return Intl.message(
      'Goal Created',
      name: 'the_goal_has_been_created',
      desc: '',
      args: [],
    );
  }

  /// `About the App`
  String get aboutTheApp {
    return Intl.message(
      'About the App',
      name: 'aboutTheApp',
      desc: '',
      args: [],
    );
  }

  /// `Name:`
  String get name {
    return Intl.message(
      'Name:',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Balancer`
  String get balancer {
    return Intl.message(
      'Balancer',
      name: 'balancer',
      desc: '',
      args: [],
    );
  }

  /// `Type:`
  String get type {
    return Intl.message(
      'Type:',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `Application`
  String get application {
    return Intl.message(
      'Application',
      name: 'application',
      desc: '',
      args: [],
    );
  }

  /// `Main Category:`
  String get mainCategory {
    return Intl.message(
      'Main Category:',
      name: 'mainCategory',
      desc: '',
      args: [],
    );
  }

  /// `Finance`
  String get finance {
    return Intl.message(
      'Finance',
      name: 'finance',
      desc: '',
      args: [],
    );
  }

  /// `Secondary Category:`
  String get secondaryCategory {
    return Intl.message(
      'Secondary Category:',
      name: 'secondaryCategory',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get none {
    return Intl.message(
      'None',
      name: 'none',
      desc: '',
      args: [],
    );
  }

  /// `Age Rating:`
  String get ageRating {
    return Intl.message(
      'Age Rating:',
      name: 'ageRating',
      desc: '',
      args: [],
    );
  }

  /// `Short Description:`
  String get shortDescription {
    return Intl.message(
      'Short Description:',
      name: 'shortDescription',
      desc: '',
      args: [],
    );
  }

  /// `Your personal finance tracker for manually recording expenses and managing budgets.`
  String get yourPersonalFinancialTrackerForManuallyRecordingExpensesAndBudget {
    return Intl.message(
      'Your personal finance tracker for manually recording expenses and managing budgets.',
      name: 'yourPersonalFinancialTrackerForManuallyRecordingExpensesAndBudget',
      desc: '',
      args: [],
    );
  }

  /// `Balancer is a simple and convenient app for tracking your finances. In today’s fast-paced world, managing money can be challenging, but Balancer is here to help. \n\nWith Balancer, you can easily record expenses, categorize them, and stay on top of your spending. Whether it’s daily purchases, major expenses, or recurring payments, Balancer keeps everything organized. \n\nPerfect for those who want to manage day-to-day expenses or analyze financial habits deeply, Balancer is your first step toward financial independence. With an intuitive interface, you’ll find it easy to track your money and control unnecessary spending. \n\nIf you’re ready to take charge of your finances, Balancer is your best ally. Start managing your budget and saving more with Balancer today!`
  String get balancerIsASimpleAndConvenientApplicationForTrackingYour {
    return Intl.message(
      'Balancer is a simple and convenient app for tracking your finances. In today’s fast-paced world, managing money can be challenging, but Balancer is here to help. \\n\\nWith Balancer, you can easily record expenses, categorize them, and stay on top of your spending. Whether it’s daily purchases, major expenses, or recurring payments, Balancer keeps everything organized. \\n\\nPerfect for those who want to manage day-to-day expenses or analyze financial habits deeply, Balancer is your first step toward financial independence. With an intuitive interface, you’ll find it easy to track your money and control unnecessary spending. \\n\\nIf you’re ready to take charge of your finances, Balancer is your best ally. Start managing your budget and saving more with Balancer today!',
      name: 'balancerIsASimpleAndConvenientApplicationForTrackingYour',
      desc: '',
      args: [],
    );
  }

  /// `Description:`
  String get description {
    return Intl.message(
      'Description:',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Contact:`
  String get contact {
    return Intl.message(
      'Contact:',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `Clear Everything`
  String get clear_everything {
    return Intl.message(
      'Clear Everything',
      name: 'clear_everything',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Warning: Deleting all data will remove EVERYTHING.`
  String get warningIfYouDeleteAllDataEverythingWillBeRemoved {
    return Intl.message(
      'Warning: Deleting all data will remove EVERYTHING.',
      name: 'warningIfYouDeleteAllDataEverythingWillBeRemoved',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Deletion`
  String get confirmDeletion {
    return Intl.message(
      'Confirm Deletion',
      name: 'confirmDeletion',
      desc: '',
      args: [],
    );
  }

  /// `All data has been deleted successfully.`
  String get allDataHasBeenDeleted {
    return Intl.message(
      'All data has been deleted successfully.',
      name: 'allDataHasBeenDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Successfully`
  String get successfully {
    return Intl.message(
      'Successfully',
      name: 'successfully',
      desc: '',
      args: [],
    );
  }

  /// `Expenses`
  String get expenses {
    return Intl.message(
      'Expenses',
      name: 'expenses',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message(
      'Amount',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `Invalid amount. Please enter a valid number.`
  String get invalidAmountPleaseEnterAValidNumber {
    return Intl.message(
      'Invalid amount. Please enter a valid number.',
      name: 'invalidAmountPleaseEnterAValidNumber',
      desc: '',
      args: [],
    );
  }

  /// `Add Category`
  String get addCategory {
    return Intl.message(
      'Add Category',
      name: 'addCategory',
      desc: '',
      args: [],
    );
  }

  /// `Select category`
  String get selectCategory {
    return Intl.message(
      'Select category',
      name: 'selectCategory',
      desc: '',
      args: [],
    );
  }

  /// `Add Transaction Category`
  String get addTransactionCategory {
    return Intl.message(
      'Add Transaction Category',
      name: 'addTransactionCategory',
      desc: '',
      args: [],
    );
  }

  /// `Transaction added`
  String get transaction_added {
    return Intl.message(
      'Transaction added',
      name: 'transaction_added',
      desc: '',
      args: [],
    );
  }

  /// `Analytics`
  String get analytics {
    return Intl.message(
      'Analytics',
      name: 'analytics',
      desc: '',
      args: [],
    );
  }

  /// `No goals available.`
  String get noGoalsAvailable {
    return Intl.message(
      'No goals available.',
      name: 'noGoalsAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Add a goal`
  String get AddGoals {
    return Intl.message(
      'Add a goal',
      name: 'AddGoals',
      desc: '',
      args: [],
    );
  }

  /// `Add a category`
  String get Add_a_category {
    return Intl.message(
      'Add a category',
      name: 'Add_a_category',
      desc: '',
      args: [],
    );
  }

  /// `Goal deleted`
  String get goalDeleted {
    return Intl.message(
      'Goal deleted',
      name: 'goalDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Periodic rate`
  String get periodicRate {
    return Intl.message(
      'Periodic rate',
      name: 'periodicRate',
      desc: '',
      args: [],
    );
  }

  /// `Budget Allocation`
  String get budgetAllocation {
    return Intl.message(
      'Budget Allocation',
      name: 'budgetAllocation',
      desc: '',
      args: [],
    );
  }

  /// `Russian`
  String get russian {
    return Intl.message(
      'Russian',
      name: 'russian',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Invalid amount must be greater than Zero`
  String get invalidAmountMustBeGreaterThanZero {
    return Intl.message(
      'Invalid amount must be greater than Zero',
      name: 'invalidAmountMustBeGreaterThanZero',
      desc: '',
      args: [],
    );
  }

  /// `My goals`
  String get myGoals {
    return Intl.message(
      'My goals',
      name: 'myGoals',
      desc: '',
      args: [],
    );
  }

  /// `Target`
  String get target {
    return Intl.message(
      'Target',
      name: 'target',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
