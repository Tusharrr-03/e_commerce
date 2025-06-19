import 'dart:async';
import 'package:e_commerce/Routes_Helper/routes_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  bool isVisible = false;

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () async{
      //Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));


      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokan = prefs.getString("tokan");
      print("Tokan from Splash : $tokan");

      String nextPageNamed = AppRoutes.ROUTELOGINSCREEN;
      if(tokan!=null){
        nextPageNamed = AppRoutes.ROUTEHOMESCREEN;
      } else{
        nextPageNamed = AppRoutes.ROUTELOGINSCREEN;
      }

      Navigator.pushNamed(context, nextPageNamed);
    });

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat();

    Timer(Duration(milliseconds: 900), (){
      isVisible = true;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: isVisible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 900),
              child: Image.asset(
                "assets/images/e_commerce_logo.png",
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              "FetchUp",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
