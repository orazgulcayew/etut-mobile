import 'package:flutter/material.dart';

class AppNavigation {
  static pushScreen(BuildContext context, screen) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => screen,
    ));
  }
}
