abstract interface class BudgetInterface {
  Future initBox() async {}

  Future boxAdd(int amountBudget, int? spent, int? left) async {}

  Future removeBox(int index) async {}

  Future removeAllBox() async {}

}