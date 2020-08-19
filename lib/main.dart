import 'package:flutter/material.dart';
import 'package:tradewinds/splash_screen.dart';
import 'package:tradewinds/purchase_history.dart';
import 'package:tradewinds/wish_list.dart';
import 'package:tradewinds/settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/wish_list': (context) => WishList(),
        '/purchase_history': (context) => PurchaseHistory(),
        '/settings': (context) => Settings(),
      },
      title: 'Tradewinds',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.black,
        accentColor: Colors.blue[400],
      ),
      home: SplashScreen(),
    );
  }
}
