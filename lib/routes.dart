
import 'package:flutter/material.dart';
import 'package:netflix_ui/screens/detail/detail_screen.dart';
import 'package:netflix_ui/screens/main_screens.dart';
import 'package:netflix_ui/screens/profile/profile_screen.dart';
import 'package:netflix_ui/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> route = {
  SplashScreen.routeName: (context) => SplashScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  MainScreens.routeName: (context) => MainScreens(),
  DetailScreen.routeName: (context) => DetailScreen()
};