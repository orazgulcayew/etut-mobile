import 'package:flutter/cupertino.dart';

class ThemeProvider extends ChangeNotifier {
  Brightness brightness = Brightness.light;

  changeBrightness() {
    if (brightness == Brightness.dark) {
      brightness = Brightness.light;
    } else {
      brightness = Brightness.dark;
    }
    notifyListeners();
  }

  isDarkMode() {
    return brightness == Brightness.dark;
  }
}
