import 'dart:async';
import 'package:e_commerce/Routes_Helper/routes_helper.dart';
import 'package:e_commerce/screens/Login%20Screens/login.dart';
import 'package:flutter/material.dart';

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

    Timer(Duration(seconds: 2), () {
      //Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
      Navigator.pushNamed(context, AppRoutes.ROUTELOGINSCREEN);
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
