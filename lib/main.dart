import 'package:flutter/material.dart';
import 'package:tradewinds/Screens/Search_Screen.dart';
 void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
 
  @override
   Widget build(BuildContext context) {
     return MaterialApp(
       title: 'TradeWinds',
       debugShowCheckedModeBanner: false,
      theme: ThemeData(
         primaryColor: Colors.white,
       ),
       home:searchScreen(),
     );
   }

import 'package:tradewinds/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tradewinds',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
