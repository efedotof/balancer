

abstract interface class HomeInterface{


  Future<void> setBalance(double num);
  Future<void> setIncome(double num);
  Future<void> setExpenses(double num);

  Future<double> getBalance();
  Future<double> getIncome();
  Future<double> getExpenses();


  Future<void> addNewBox(String title, String amount, DateTime date);
  Future<void> removeBox(int index);

 


}