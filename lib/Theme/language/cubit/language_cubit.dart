import 'package:balancer/Theme/language/repository/language_interface.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'language_state.dart';
part 'language_cubit.freezed.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit({required LanguageInterface interface}) : _interface = interface, super(const LanguageState(locale: 'ru'));

  final LanguageInterface _interface;

   Future<void>setLocale(String locale) async{
    try {
      emit(LanguageState(locale:locale));
      await _interface.setLocale(locale);
      
    } catch (e) {
      debugPrint(e.toString());
    }
  }


  String checkLocale(){
    final locale = _interface.isLocale();
    return locale;
  }


}
