import 'dart:io';

import 'package:etut_mobile/global/providers/theme_provider.dart';
import 'package:etut_mobile/navigation/views/navigation.dart';
import 'package:etut_mobile/repository/http_overrides.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        )
      ],
      builder: (context, child) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ETUT Mobile',
          theme: ThemeData(
              useMaterial3: true,
              brightness: themeProvider.brightness,
              colorSchemeSeed: Colors.lightBlue,
              fontFamily: "Nunito"),
          home: const NavigationScreen(),
        );
      },
    );
  }
}
