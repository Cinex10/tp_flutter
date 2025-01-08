import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeBloc {
  static const String _themeKey = 'isDarkMode';
  final SharedPreferences _prefs;

  final _isDarkModeController = BehaviorSubject<bool>();

  Stream<bool> get isDarkMode => _isDarkModeController.stream;

  ThemeBloc(this._prefs) {
    // Charger la préférence de thème sauvegardée ou utiliser le mode clair par défaut
    final savedTheme = _prefs.getBool(_themeKey) ?? false;
    _isDarkModeController.add(savedTheme);
  }

  void toggleTheme() {
    final currentMode = _isDarkModeController.value;
    final newMode = !currentMode;
    _isDarkModeController.add(newMode);
    _prefs.setBool(_themeKey, newMode);
  }

  void dispose() {
    _isDarkModeController.close();
  }
}
