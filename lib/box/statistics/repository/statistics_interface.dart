abstract interface class StatisticsInterface {
  Future initBox() async {}

  Future boxAdd(
    double amountExpenses,
    double amountIncome,
  ) async {}

  Future removeBox(int index) async {}

  Future removeAllBox() async {}
  Future<void> updateAmounts(
      int index, double additionalExpenses, double additionalIncome);
}
