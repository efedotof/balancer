import 'package:flutter/material.dart';

class BudgetProvider with ChangeNotifier {
  int spent = 0;
  int amountBudget = 0;
  int left = 0;

  int expenses = 0;

  bool isLast = false;
  bool isSumm = false;
  bool isPercentageSelected = false;

  bool isStartToAdd = false;

  void setSpent({required int spentw}) {
    spent = spentw;
    notifyListeners();
  }

  void setLeft({required int leftw}) {
    left = leftw;
    notifyListeners();
  }

  void setAmountBudget({required int amountBudgetw}) {
    amountBudget = amountBudgetw;
    notifyListeners();
  }

  void setExpenses({required int expensesw}) {
    expenses = expensesw;
    notifyListeners();
  }



  void changeIsLast(){
    isLast = true;
    notifyListeners();
  }
  void changeIsSumm(){
    isSumm = true;
    notifyListeners();
  }

  void changePercantageSelector({required bool value}){
    isPercentageSelected = value;
    notifyListeners();
  }
}
