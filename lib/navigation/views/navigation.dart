import 'package:etut_mobile/articles/views/articles_screen.dart';
import 'package:etut_mobile/global/providers/theme_provider.dart';
import 'package:etut_mobile/home/views/home_screen.dart';
import 'package:etut_mobile/faculties/views/faculties_screen.dart';
import 'package:etut_mobile/news/views/news_reader_screen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:gap/gap.dart';
import 'package:heroicons/heroicons.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../cource_center/views/course_center_screen.dart';
import '../../education_portal/views/education_portal_screen.dart';
import '../../news/views/news_screen.dart';
import '../../talents/views/talents_screen.dart';
import '../../vrtour/views/vrtour_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final screens = [
    HomeScreen(),
    NewsScreen(),
    FacultiesScreen(),
    VrTourScreen(),
    ArticlesScreen(),
    CourseCenterScreen(),
    TalentsScreen(),
    EducationPortalScreen()
  ];
  int screenIndex = 0;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      drawer: NavigationDrawer(
        selectedIndex: screenIndex,
        onDestinationSelected: (value) {
          setState(() {
            screenIndex = value;
          });
        },
        children: [
          DrawerHeader(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  const Text("ETUT Mobile",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        provider.changeBrightness();
                      },
                      icon: provider.isDarkMode()
                          ? const Icon(Icons.dark_mode)
                          : const Icon(
                              Icons.light_mode,
                              color: Colors.orange,
                            ))
                ],
              ),
              const FlutterLogo(size: 60),
            ],
          )),
          const NavigationDrawerDestination(
              icon: Icon(Icons.home_filled), label: Text("Home")),
          const NavigationDrawerDestination(
              icon: Icon(Icons.newspaper), label: Text("News")),
          const NavigationDrawerDestination(
              icon: Icon(Icons.school), label: Text("Faculties")),
          const NavigationDrawerDestination(
              icon: Icon(Icons.vrpano_rounded), label: Text("360VR tour")),
          const NavigationDrawerDestination(
              icon: Icon(Icons.article), label: Text("Articles")),
          const NavigationDrawerDestination(
              icon: Icon(Icons.computer_rounded), label: Text("Course center")),
          const NavigationDrawerDestination(
              icon: Icon(Icons.people_rounded), label: Text("Talents")),
          const NavigationDrawerDestination(
              icon: Icon(Icons.cast_for_education_rounded),
              label: Text("Education portal")),
        ],
      ),
      body: screens[screenIndex],
    );
  }
}
