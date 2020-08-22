import 'package:flutter/material.dart';
import 'package:tradewinds/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        brightness: Brightness.dark,
        title: Text(
          'Welcome to Tradewinds!',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
    );
  }
}