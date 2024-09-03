import 'package:balancer/box/repository/box_interface.dart';
import 'package:balancer/features/home/repository/home_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class  HomeRepository implements HomeInterface {


  final SharedPreferences preferences;

  HomeRepository( {required this.preferences, required BoxInterface boxInterface}) : _boxInterface = boxInterface{
    getBalance();
    getExpenses();
    getIncome();
    _boxInterface.initBox();
  }

  static const _isHomeBalanceKey = 'home_balance_key';
  static const _isHomeExpensesKey = 'home_expenses_key';
  static const _isHomeIncomeKey = 'home_income_key';


  final BoxInterface _boxInterface;


  @override 
  Future<double> getBalance() async {
    final balance = preferences.getDouble(_isHomeBalanceKey) ;
    return balance ?? 0;
  }

  @override
  Future<double> getExpenses() async {
    final expenses = preferences.getDouble(_isHomeExpensesKey);
    return expenses ?? 0;
  }

  @override
  Future<double> getIncome() async {
    final income = preferences.getDouble(_isHomeIncomeKey);
    return income ?? 0;
  } 

  @override
  Future<void> setBalance(double num) async {
    await preferences.setDouble(_isHomeBalanceKey, num);
  }

  @override
  Future<void> setExpenses(double num) async {
    await preferences.setDouble(_isHomeExpensesKey, num);
  }

  @override
  Future<void> setIncome(double num) async {
    await preferences.setDouble(_isHomeIncomeKey, num);
  }


  @override
  Future<void> addNewBox(String title, String amount, DateTime date) async {
    _boxInterface.boxAdd(title, amount, date);
  }


  @override
  Future<void> removeBox(int index) async {
    _boxInterface.removeBox(index);
  }

  

}