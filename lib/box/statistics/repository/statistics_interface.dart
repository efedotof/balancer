abstract interface class StatisticsInterface {
  Future initBox() async {}

  Future boxAdd(
    int amountExpenses,
    int amountIncome,
  ) async {}

  Future removeBox(int index) async {}

  Future removeAllBox() async {}
  Future<void> updateAmounts(
      int index, int additionalExpenses, int additionalIncome);
}
