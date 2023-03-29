import 'package:etut_mobile/global/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:gap/gap.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';
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
      appBar: AppBar(
        surfaceTintColor: colors.surfaceTint,
        backgroundColor: colors.background,
        title: const Text("ETUT"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
            child: PopupMenuButton(
              onSelected: (value) {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              itemBuilder: (BuildContext context) {
                return const [
                  PopupMenuItem(
                    value: 0,
                    child: Text("🇹🇲 Türkmençe"),
                  ),
                  PopupMenuItem(
                    value: 1,
                    child: Text("🇬🇧 English"),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text("🇷🇺 Русский"),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text("🇯🇵 Japanese"),
                  )
                ];
              },
              child: const Icon(
                Icons.language,
                size: 30,
              ),
            ),
          ),
          const Gap(8),
        ],
      ),
      body: PersistentTabView(
        context,
        controller: provider.persistentTabController,
        screens: provider.screens,
        backgroundColor: colors.background,
        items: [
          PersistentBottomNavBarItem(
            icon: const Icon(FeatherIcons.home),
            // inactiveIcon: const Icon(FluentIcons.home_24_regular),
            title: ("Home"),
            // activeColorPrimary: AppColors.primaryColor,
            activeColorSecondary: colors.onSecondaryContainer,
            inactiveColorPrimary: colors.onSurfaceVariant,

            textStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(FeatherIcons.search),
            // inactiveIcon: const Icon(CupertinoIcons.square_grid_2x2),
            title: ("Search"),
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
            // activeColorPrimary: AppColors.primaryColor,
            activeColorSecondary: colors.onSecondaryContainer,
            inactiveColorPrimary: colors.onSurfaceVariant,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(UniconsLine.newspaper),
            // inactiveIcon: const Icon(CupertinoIcons.person),
            title: ("News"),
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
            // activeColorPrimary: colors.,
            activeColorSecondary: colors.onSecondaryContainer,
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
        navBarStyle: NavBarStyle.style9,
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
