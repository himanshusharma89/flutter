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

}
