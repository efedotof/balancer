abstract interface class GoalsInterface {
  Future initBox() async {}

  Future boxAdd(String title, int goalsAmount) async {}

  Future removeBox(int index) async {}

  Future removeAllBox() async {}
}
