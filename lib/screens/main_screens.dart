import 'package:flutter/material.dart';
import 'package:netflix_ui/constants.dart';
import 'package:netflix_ui/models/nav_item.dart';
import 'package:netflix_ui/screens/coming/coming_screen.dart';
import 'package:netflix_ui/screens/contents_list/contents_list_screen.dart';
import 'package:netflix_ui/screens/home/home_screen.dart';

class MainScreens extends StatefulWidget {
  static String routeName = "/main_screens";

  const MainScreens({Key? key}) : super(key: key);

  @override
  State<MainScreens> createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  int _selectedIndex = 0;
  List pages = [
    HomeScreen(),
    ComingScreen(),
    ContentsListScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: kDarkColor,
        selectedFontSize: 12.0,
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
        items: List.generate(
          navItems.length,
            (index) => BottomNavigationBarItem(
              icon: Icon(navItems[index].icon),
              label: navItems[index].label,
            ),
        ),
      ),
    );
  }
}
