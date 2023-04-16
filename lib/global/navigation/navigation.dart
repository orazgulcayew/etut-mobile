import 'package:flutter/material.dart';

class AppNavigations {
  static materialPushReplaceScreen(BuildContext context, screen) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => screen));
  }

  static pushScreen(BuildContext context, screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }
}
