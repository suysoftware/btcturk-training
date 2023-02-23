import 'package:btcturk_training/src/constants/app_constants.dart';
import 'package:btcturk_training/src/screens/category/CategoryScreen.dart';
import 'package:btcturk_training/src/screens/main/MainScreen.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';

//NavigationBar Sections Enum
enum _SelectedTab { home, favorite, search, person }

class BtcBottomNavigationBar extends StatefulWidget {
  const BtcBottomNavigationBar({super.key});

  @override
  State<BtcBottomNavigationBar> createState() => _BtcBottomNavigationBarState();
}

class _BtcBottomNavigationBarState extends State<BtcBottomNavigationBar> {
  var _selectedTab = _SelectedTab.home;
  final pages = [MainScreen(), CategoryScreen()];
  int _currentIndex = 0;
  void changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorConstants.themeWhite,
      body: pages[_currentIndex],
      bottomNavigationBar: DotNavigationBar(
        marginR: EdgeInsets.symmetric(horizontal: 80, vertical: 20),

        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        onTap: changePage,
        // dotIndicatorColor: Colors.black,
        items: [
          /// Home
          DotNavigationBarItem(
              icon: const Icon(Icons.home),
              selectedColor: Colors.brown,
              unselectedColor: Colors.grey[200]),

          /// Likes
          DotNavigationBarItem(
              icon: const Icon(Icons.list),
              selectedColor: Colors.brown,
              unselectedColor: Colors.grey[200]),

          /// Search
        ],
      ),
    );
  }
}
