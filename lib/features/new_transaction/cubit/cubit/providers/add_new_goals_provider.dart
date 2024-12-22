import 'package:balancer/Theme/providers/export_providers.dart';
import 'package:balancer/box/goals/goals.dart';

class AddNewGoalsProvider with ChangeNotifier {
  Goals? goalsToSelected;

  void goalsToSelecte({required Goals select}){
    goalsToSelected = select;
    notifyListeners();
  
  }

  void goalsSelectToClean(){
    goalsToSelected = null;
    notifyListeners();
  }




}