import 'package:e_commerce/Routes_Helper/routes_helper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

        textTheme: TextTheme(
          headlineLarge: TextStyle(fontFamily: 'Poppins', fontSize: 34, fontWeight: FontWeight.bold),
        )
      ),
      //home: CartPage(),
      initialRoute: AppRoutes.ROUTESPLASHSCREEN,
      routes: AppRoutes.getRoutes(),
    );
  }
}
