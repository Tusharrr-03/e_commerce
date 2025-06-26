import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Center(
              child: Container(
                width: 120,
                height: 120,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/avtar.jpg",),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
