

import 'package:shared_preferences/shared_preferences.dart';
import 'language_interface.dart';

class LanguageRepository implements LanguageInterface {


  final SharedPreferences _prefs;

  LanguageRepository({required SharedPreferences prefs}) : _prefs = prefs;

  static const _isLocale = 'locale';


  @override
  String isLocale() {
    final locale = _prefs.getString(_isLocale) ?? 'ru';
    return locale;
  }

  @override
  Future<void> setLocale(String local) async {
    await _prefs.setString(_isLocale, local);
  }

}