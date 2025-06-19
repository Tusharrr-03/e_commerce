import 'package:e_commerce/screens/login/login.dart';
import 'package:e_commerce/screens/sign_up/sign_up.dart';
import 'package:e_commerce/screens/cart/cart_page.dart';
import 'package:e_commerce/screens/detail/detail_page.dart';
import 'package:e_commerce/screens/home/home_page.dart';
import 'package:e_commerce/screens/splash/splash_screen.dart';
import 'package:e_commerce/utils/constants/utils_helper.dart';
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
