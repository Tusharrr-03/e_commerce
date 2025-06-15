import 'package:e_commerce/Routes_Helper/routes_helper.dart';
import 'package:e_commerce/screens/Login%20Screens/login.dart';
import 'package:e_commerce/utils/app_const.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  var nameInputController = TextEditingController();
  var emailInputController = TextEditingController();
  var passInputController = TextEditingController();
  var cnfPassInputController = TextEditingController();
  bool isPassVisible = true;
  bool isCnfPassVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40,),
                Container(
                  child: Text(
                    "Sign up",
                    style: mTextStyle34(mFontWeight: FontWeight.w900),
                  ),
                ),SizedBox(height: 10,),
                Container(
                  child: Text("Sing Up using Social Media" , style: mTextStyle14(mColors: Color(0xff5A5C5B), mFontWeight: FontWeight.bold)),
                ),SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/facebook.png", width: 50, height: 50, fit: BoxFit.cover,),SizedBox(width: 20,),
                    Image.asset("assets/images/google+.png", width: 50, height: 50, fit: BoxFit.cover,),SizedBox(width: 20,),
                    Image.asset("assets/images/linkedin.png", width: 50, height: 50, fit: BoxFit.cover,),
                  ],
                ),SizedBox(height: 70,),
                Divider(thickness: 2,height: 2, endIndent: 10, indent: 10,)
              ],
            ),
          ),
          Expanded(flex: 2,
              child: Container(
                padding: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      TextField(
                        controller: nameInputController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            hintText: "Enter Name here",
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
                      ),SizedBox(height: 20,),
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
                      ),SizedBox(height: 20,),
                      TextField(
                        controller: passInputController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !isPassVisible,
                        decoration: InputDecoration(
                            hintText: "Enter Password",
                            hintStyle: mTextStyle12(),
                            prefixIcon: Icon(Icons.password),
                            suffixIcon: IconButton(onPressed: (){
                              isPassVisible = !isPassVisible;
                              setState(() {});
                            }, icon: Icon(isPassVisible ? Icons.visibility : Icons.visibility_off)),
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
                      ),SizedBox(height: 20,),
                      TextField(
                        controller: cnfPassInputController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !isCnfPassVisible,
                        decoration: InputDecoration(
                            hintText: "Enter Password",
                            hintStyle: mTextStyle12(),
                            prefixIcon: Icon(Icons.password),
                            suffixIcon: IconButton(onPressed: (){
                              isPassVisible = !isCnfPassVisible;
                              setState(() {});
                            }, icon: Icon(isCnfPassVisible ? Icons.visibility : Icons.visibility_off)),
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
                      ),SizedBox(height: 40,),


                      /// Elevated Button
                      Container(
                        width: 250,
                        height: 50,
                        child: ElevatedButton(onPressed: (){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sign up Successfully")));
                          Navigator.pushReplacementNamed(context, AppRoutes.ROUTELOGINSCREEN);
                        }, style: ElevatedButton.styleFrom(
                          backgroundColor: AppConstants.primaryColors,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
                        ) ,child: Text("Sign Up", style: mTextStyle16(mColors: Colors.white),)),
                      ),SizedBox(height: 20,),

                      /// Already have an Account
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Already have an Account? ", style: mTextStyle14(mColors: Colors.grey),),
                            TextButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                              //Navigator.pushNamed(context, AppRoutes.ROUTELOGINSCREEN);
                            }, child: Text("Log in" , style: mTextStyle14(mColors: AppConstants.primaryColors),)),
                          ],
                        ),
                      ),

                    ],
                  )
              )),
        ],
      ),
    );
  }
}
