import 'package:e_commerce/Routes_Helper/routes_helper.dart';
import 'package:e_commerce/data/remote/helper/api_helper.dart';
import 'package:e_commerce/data/remote/repository/category_repo.dart';
import 'package:e_commerce/data/remote/repository/product_repo.dart';
import 'package:e_commerce/data/remote/repository/user_repo.dart';
import 'package:e_commerce/screens/home/bloc/category/category_bloc.dart';
import 'package:e_commerce/screens/home/bloc/product/product_bloc.dart';
import 'package:e_commerce/screens/login/bloc/login_bloc.dart';
import 'package:e_commerce/screens/sign_up/bloc/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<SignUpBloc>(
          create:
              (context) =>
                  SignUpBloc(userRepo: UserRepo(apiHelper: ApiHelper())),
        ),
        BlocProvider(
          create:
              (context) =>
                  LoginUserBloc(userRepo: UserRepo(apiHelper: ApiHelper())),
        ),
        BlocProvider(
          create:
              (context) =>
                  ProductBloc(productRepo: ProductRepo(apiHelper: ApiHelper())),
        ),
        BlocProvider(
          create:
              (context) => CatBloc(catRepo: CatRepo(apiHelper: ApiHelper())),
        ),
      ],
      child: MyApp(),
    ),
  );
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
          headlineLarge: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 34,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      //home: CartPage(),
      initialRoute: AppRoutes.ROUTESPLASHSCREEN,
      routes: AppRoutes.getRoutes(),
    );
  }
}
