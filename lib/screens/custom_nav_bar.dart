import 'package:flutter/material.dart';
import 'package:flutter_games_categories/screens/home.dart';
import 'package:flutter_games_categories/screens/profile.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class CustomNavBar extends StatelessWidget {
  CustomNavBar({super.key});

  PersistentTabController _tabController =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildScreens() {
      return [
        HomeScreen(),
        ProfileScreen(),
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: Icon(Icons.home_filled),
          title: ("Home"),
          activeColorPrimary: Theme.of(context).primaryColor.withAlpha(200),
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.person_outlined),
          title: ("Settings"),
          activeColorPrimary: Theme.of(context).primaryColor,
          inactiveColorPrimary: Colors.grey,
        ),
      ];
    }

    return PersistentTabView(
      context,
      controller: _tabController,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }
}
