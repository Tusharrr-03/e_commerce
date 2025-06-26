import 'package:e_commerce/screens/favourite/fav_item_page.dart';
import 'package:e_commerce/screens/login/login.dart';
import 'package:e_commerce/screens/profile/profile_page.dart';
import 'package:e_commerce/screens/sign_up/sign_up.dart';
import 'package:e_commerce/screens/cart/cart_page.dart';
import 'package:e_commerce/screens/detail/detail_page.dart';
import 'package:e_commerce/screens/home/home_page.dart';
import 'package:e_commerce/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String ROUTESPLASHSCREEN = '/splash';
  static const String ROUTELOGINSCREEN = '/login';
  static const String ROUTESIGNUPSCREEN = '/signup';
  static const String ROUTEHOMESCREEN = '/home';
  static const String ROUTEDETAILSCREEN = '/detail';
  static const String ROUTECARTSCREEN = '/cart';
  static const String ROUTEPROFILESCREEN = '/profile';
  static const String ROUTEFAVITEMSCREEN = '/wishlist';

  static Map<String, WidgetBuilder> getRoutes() => {
    ROUTESPLASHSCREEN: (context) => SplashScreen(),
    ROUTELOGINSCREEN: (context) => Login(),
    ROUTESIGNUPSCREEN: (context) => SignUp(),
    ROUTEHOMESCREEN: (context) => HomePage(),
    ROUTEDETAILSCREEN: (context) => DetailPage(),
    ROUTECARTSCREEN: (context) => CartPage(),
    ROUTEPROFILESCREEN: (context) => ProfilePage(),
    ROUTEFAVITEMSCREEN: (context) => FavItemPage(),
  };
}
