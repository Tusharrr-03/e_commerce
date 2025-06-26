import 'package:flutter/material.dart';

class FavItemPage extends StatelessWidget {
  const FavItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wishlist"),
        centerTitle: true,
      ),
    );
  }
}
