import 'package:e_commerce/Routes_Helper/routes_helper.dart';
import 'package:e_commerce/screens/login/bloc/login_bloc.dart';
import 'package:e_commerce/screens/login/bloc/login_event.dart';
import 'package:e_commerce/screens/login/bloc/login_state.dart';
import 'package:e_commerce/utils/constants/app_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailInputController = TextEditingController();
  var passInputController = TextEditingController();
  bool isPassVisible = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50,),
                Container(
                  child: Text("Login to your Account",
                    style: mTextStyle24(mFontWeight: FontWeight.w900),),
                ),
                SizedBox(height: 10,),
                Container(
                  child: Text("Login using Social Media", style: mTextStyle14(
                      mColors: Color(0xff5A5C5B), mFontWeight: FontWeight.bold)),
                ), SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/facebook.png", width: 50,
                      height: 50,
                      fit: BoxFit.cover,), SizedBox(width: 20,),
                    Image.asset("assets/images/google+.png", width: 50,
                      height: 50,
                      fit: BoxFit.cover,), SizedBox(width: 20,),
                    Image.asset("assets/images/linkedin.png", width: 50,
                      height: 50,
                      fit: BoxFit.cover,),
                  ],
                ), SizedBox(height: 90,),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(height: 1, color: Colors.grey, width: 120,),
                      SizedBox(width: 5,),
                      Text("OR"),
                      SizedBox(width: 5,),
                      Container(height: 1, color: Colors.grey, width: 120,),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  TextField(
                    controller: emailInputController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: "Enter your Mail",
                        hintStyle: mTextStyle12(),
                        prefixIcon: Icon(Icons.mail),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(color: Colors.transparent),
                        )
                    ),
                  ), SizedBox(height: 20,),
                  TextField(
                    controller: passInputController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !isPassVisible,
                    decoration: InputDecoration(
                        hintText: "Enter Password",
                        hintStyle: mTextStyle12(),
                        prefixIcon: Icon(Icons.password),
                        suffixIcon: IconButton(onPressed: () {
                          isPassVisible = !isPassVisible;
                          setState(() {});
                        },
                            icon: Icon(isPassVisible ? Icons.visibility : Icons
                                .visibility_off)),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(color: Colors.transparent),
                        )
                    ),
                  ), SizedBox(height: 40,),
        
                  /// Elevated Button
                  Container(
                      width: 250,
                      height: 50,
                      child: BlocListener<LoginUserBloc, LoginState>(listener: (_, state) {
                       print(state);
        
                        if(state is LoginUserLoadingState){
                          isLoading = true;
                          setState(() {
        
                          });
                        }
        
                        if(state is LoginUserFailureState){
                          isLoading = false;
                          print(state.errMsg);
                          setState(() {
        
                          });
                        }
        
                        if(state is LoginUserSuccessState){
                          /// Navigate to the Home Page
                          /// Show snack bar
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text("Login Successfully"),)));
                          Navigator.pushReplacementNamed(context, AppRoutes.ROUTEHOMESCREEN);
                        }
        
                      }, child: ElevatedButton(onPressed: () {
        
                        Map<String, dynamic> mParams = {
                          "email":"${emailInputController.text}",
                          "password":passInputController.text
                        };
        
                        context.read<LoginUserBloc>().add(AuthUserLoginEvent(bodyParams: mParams));
        
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        //Navigator.pushNamed(context, AppRoutes.ROUTEHOMESCREEN);
                      },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppConstants.primaryColors,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(21)),
                          ),
                          child: Text("Login",
                            style: mTextStyle16(mColors: Colors.white),)),)
                  ),
        
                  /// Don't have an Account
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Don't have an Account? ",
                          style: mTextStyle14(mColors: Colors.grey),),
                        TextButton(onPressed: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                          Navigator.pushNamed(
                              context, AppRoutes.ROUTESIGNUPSCREEN);
                        },
                            child: Text(
                              "Sign Up", style: mTextStyle14(mColors: AppConstants
                                .primaryColors),)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
