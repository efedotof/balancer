

abstract interface class BoxInterface {
  Future initBox() async{}

  
  Future boxAdd(String title, String amount, DateTime date) async{}

  
  Future removeBox(int index) async{}

  
  Future removeAllBox() async{}





}