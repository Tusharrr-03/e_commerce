import 'package:e_commerce/screens/Login%20Screens/login.dart';
import 'package:e_commerce/screens/Login%20Screens/sign_up.dart';
import 'package:e_commerce/screens/cart_page.dart';
import 'package:e_commerce/screens/detail_page.dart';
import 'package:e_commerce/screens/home_page.dart';
import 'package:e_commerce/screens/splash_screen.dart';
import 'package:e_commerce/utils/utils_helper.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String ROUTESPLASHSCREEN = '/splash';
  static const String ROUTELOGINSCREEN = '/login';
  static const String ROUTESIGNUPSCREEN = '/signup';
  static const String ROUTEHOMESCREEN = '/home';
  static const String ROUTEDETAILSCREEN = '/detail';
  static const String ROUTECARTSCREEN = '/cart';

  static Map<String, WidgetBuilder> getRoutes() => {
    ROUTESPLASHSCREEN: (context) => SplashScreen(),
    ROUTELOGINSCREEN: (context) => Login(),
    ROUTESIGNUPSCREEN: (context) => SignUp(),
    ROUTEHOMESCREEN: (context) => HomePage(),
    //ROUTEDETAILSCREEN: (context) => DetailPage(productDetail:,),
    ROUTECARTSCREEN: (context) => CartPage(),
  };
}
