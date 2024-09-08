import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'switch_state.dart';

class SwitchCubit extends Cubit<bool> {
  SwitchCubit() : super(false);

  void toggleSwitch(bool newValue) => emit(newValue);

  void resetSwitch() => emit(false);

}
