import 'package:balancer/Theme/providers/export_providers.dart';
import 'package:balancer/box/goals/goals.dart';

class AddNewGoalsProvider with ChangeNotifier {
  Goals? goalsToSelected;

  DateTime? time;

  double total = 0;


  void goalsToSelecte({required Goals select}){
    goalsToSelected = select;
    notifyListeners();
  
  }

  void addNewGoalsToClean(){
    goalsToSelected = null;
    time = null;
    notifyListeners();
  }


  void updateDateTime({required DateTime newTime}){
    time = newTime;
    notifyListeners();
  }

  void updateTotal({required double newTotal}){
    debugPrint('Тотал : $newTotal');
    total += newTotal;
    notifyListeners();
  }

  void totalToClean(){
    total = 0;
    notifyListeners();
  }




}