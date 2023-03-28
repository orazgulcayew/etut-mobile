import 'package:etut_mobile/global/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import '../providers/bottom_navigation_provider.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<BottomNavigationBarProvider>(context, listen: false);
    final colors = AppStyles.colorScheme(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // appBar: AppBar(
      //   surfaceTintColor: colors.surfaceTint,
      //   backgroundColor: colors.background,
      //   title: Container(
      //     height: 36,
      //     decoration: ShapeDecoration(
      //         shape: RoundedRectangleBorder(
      //             side: BorderSide(color: colors.outline, width: 1),
      //             borderRadius: BorderRadius.circular(8)),
      //         color: colors.background),
      //     child: Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 12),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Text(
      //             StringKeys.search_hint.tr(),
      //             style: const TextStyle(fontSize: 14),
      //           ),
      //           const Icon(CupertinoIcons.search, size: 20),
      //         ],
      //       ),
      //     ),
      //   ),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
      //       child: PopupMenuButton(
      //         onSelected: (value) {
      //           switch (value) {
      //             case 0:
      //               context.setLocale(const Locale('tk'));
      //               break;
      //             case 1:
      //               context.setLocale(const Locale('en'));
      //               break;
      //             case 2:
      //               context.setLocale(const Locale('ru'));
      //               break;
      //           }
      //         },
      //         shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(12)),
      //         itemBuilder: (BuildContext context) {
      //           return const [
      //             PopupMenuItem(
      //               value: 0,
      //               child: Text("🇹🇲 Türkmençe"),
      //             ),
      //             PopupMenuItem(
      //               value: 1,
      //               child: Text("🇬🇧 English"),
      //             ),
      //             PopupMenuItem(
      //               value: 2,
      //               child: Text("🇷🇺 Русский"),
      //             )
      //           ];
      //         },
      //         child: const Icon(
      //           Icons.language,
      //           size: 30,
      //         ),
      //       ),
      //     ),
      //     const Gap(8),
      //   ],
      // ),
      body: PersistentTabView(
        context,
        controller: provider.persistentTabController,
        screens: provider.screens,
        backgroundColor: Colors.white,
        items: [
          PersistentBottomNavBarItem(
            icon: const Icon(Linee),
            inactiveIcon: const Icon(FluentIcons.home_24_regular),
            title: ("Home"),
            // activeColorPrimary: AppColors.primaryColor,
            // activeColorSecondary: colors.onSecondaryContainer,
            inactiveColorPrimary: colors.onSurfaceVariant,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(CupertinoIcons.square_grid_2x2_fill),
            inactiveIcon: const Icon(CupertinoIcons.square_grid_2x2),
            title: ("Search"),
            activeColorPrimary: AppColors.primaryColor,
            // activeColorSecondary: colors.onSecondaryContainer,
            inactiveColorPrimary: colors.onSurfaceVariant,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(CupertinoIcons.person_fill),
            inactiveIcon: const Icon(CupertinoIcons.person),
            title: ("News"),
            activeColorPrimary: ,
            // activeColorSecondary: colors.onSecondaryContainer,
            inactiveColorPrimary: colors.onSurfaceVariant,
          ),
        ],
        resizeToAvoidBottomInset: true,
        confineInSafeArea: true,
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: const NavBarDecoration(
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        // screenTransitionAnimation: const ScreenTransitionAnimation(
        //   // Screen transition animation on change of selected tab.
        //   animateTabTransition: true,
        //   curve: Curves.ease,
        //   duration: Duration(milliseconds: 200),
        // ),
        navBarStyle:
            NavBarStyle.style8, // Choose the nav bar style with this property.
      ),
    );
  }
}

// bottomNavigationBar: BottomNavigationBar(
//         currentIndex: provider.selectedIndex,
//         onTap: (index) => provider.changeIndex(index),
//         selectedItemColor: AppColors.primaryColor,
//         unselectedItemColor: Colors.black,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(provider.selectedIndex == 0
//                 ? CupertinoIcons.house_fill
//                 : CupertinoIcons.home),
//             label: StringKeys.home.tr(),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(provider.selectedIndex == 1
//                 ? CupertinoIcons.square_stack_3d_down_right_fill
//                 : CupertinoIcons.square_stack_3d_down_right),
//             label: StringKeys.brands.tr(),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(provider.selectedIndex == 2
//                 ? CupertinoIcons.cart_fill
//                 : CupertinoIcons.cart),
//             label: StringKeys.cart.tr(),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(provider.selectedIndex == 3
//                 ? CupertinoIcons.heart_fill
//                 : CupertinoIcons.heart),
//             label: StringKeys.favourites.tr(),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(provider.selectedIndex == 4
//                 ? CupertinoIcons.person_fill
//                 : CupertinoIcons.person),
//             label: StringKeys.profile.tr(),
//           ),
//         ],
//       ),

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const Center(
        child: Text("Screen 2"),
      ),
    );
  }
}

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: const Center(
        child: Text("Screen 4"),
      ),
    );
  }
}

class Screen5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: const Center(
        child: Text("Screen 5"),
      ),
    );
  }
}
