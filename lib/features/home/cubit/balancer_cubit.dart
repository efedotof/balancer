import 'package:balancer/features/home/repository/home_interface.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'balancer_state.dart';

class BalancerCubit extends Cubit<BalancerState> {
  BalancerCubit({required HomeInterface interface}) : _interface = interface, super(BalancerInitial()){
    getCard();
  }

  final HomeInterface _interface;

  double income = 0;
  double expenses = 0;
  double balance = 0;

  void getCard() async {
    balance = await _interface.getBalance();
    expenses = await _interface.getExpenses();
    income = await _interface.getIncome();
    emit(HomeUpdated(balance: balance, income: income, expenses: expenses));
  }

  Future<void> updateBalance(double num, {required bool isIncome}) async {
    balance += isIncome ? num : -num;
    isIncome ? income += num : expenses += num;
    await _interface.setBalance(balance);
    await _interface.setIncome(income);
    await _interface.setExpenses(expenses);
    emit(HomeUpdated(balance: balance, income: income, expenses: expenses)); 
  }

  void resetBalance() {
    balance = 0;
    income = 0;
    expenses = 0;
    emit(HomeUpdated(balance: balance, income: income, expenses: expenses)); 
  }
}
