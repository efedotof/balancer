import 'package:flutter/material.dart';

class BudgetProvider with ChangeNotifier {
  double spent = 0;
  double amountBudget = 0;
  double left = 0;

  double expenses = 0;

  bool isLast = false;
  bool isSumm = false;
  bool isPercentageSelected = false;

  bool isStartToAdd = false;

  void setSpent({required double spentw}) {
    spent = spentw;
    notifyListeners();
  }

  void setLeft({required double leftw}) {
    left = leftw;
    notifyListeners();
  }

  void setAmountBudget({required double amountBudgetw}) {
    amountBudget = amountBudgetw;
    notifyListeners();
  }

  void setExpenses({required double expensesw}) {
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
