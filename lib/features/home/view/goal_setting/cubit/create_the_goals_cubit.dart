import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'create_the_goals_state.dart';
part 'create_the_goals_cubit.freezed.dart';

class CreateTheGoalsCubit extends Cubit<CreateTheGoalsState> {
  CreateTheGoalsCubit() : super(const CreateTheGoalsState.initial());


  void isStartCreate(){
    



    // if(title.isNotEmpty && goalsAmount>0){
    //   if(mode == GoalMode.percentage){
    //     if(percentage != 0){
    //       emit(const CreateTheGoalsState.create());
    //     }else{
        
    //     }
      
    //   }else{
    //   emit(const CreateTheGoalsState.create());
    //   }
    // }else{
    
    // }
  }









}
