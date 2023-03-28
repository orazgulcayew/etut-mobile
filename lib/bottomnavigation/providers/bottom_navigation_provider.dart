import 'package:etut_mobile/news/views/news_screen.dart';
import 'package:etut_mobile/search/views/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../home copy/home/views/home_screen.dart';
import '../views/bottom_navigation.dart';

class BottomNavigationBarProvider extends ChangeNotifier {
  final persistentTabController = PersistentTabController(initialIndex: 0);

  final List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const NewsScreen(),
  ];
}
