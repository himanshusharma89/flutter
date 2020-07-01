import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

void main() => runApp(MaterialApp(
    title: "GNav",
    theme: ThemeData(
      primaryColor: Colors.grey[800],
    ),
    home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Likes',
      style: optionStyle,
    ),
    Text(
      'Index 2: Search',
      style: optionStyle,
    ),
    Text(
      'Index 3: Profile',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Bottom Navigation Bar')),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: 
      SafeArea(
        child: Container(
          decoration: 
          BoxDecoration(
            color: Colors.white, 
            boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
          ]),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GNav(
                  gap: 8,
                  activeColor: Colors.white,
                  iconSize: 30,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  duration: Duration(milliseconds: 500),
                  tabBackgroundColor: Colors.grey[800].withOpacity(.9),
                  tabs: [
                    GButton(
                      backgroundColor: Colors.yellow,
                      textColor: Colors.black,
                      iconActiveColor: Colors.black,
                      icon: LineIcons.home,
                      text: 'Home',
                    ),
                    GButton(
                      backgroundColor: Colors.pink[300],
                      textColor: Colors.black,
                      iconActiveColor: Colors.black,
                      icon: LineIcons.heart_o,
                      text: 'Likes',
                    ),
                    GButton(
                      backgroundColor: Colors.greenAccent,
                      textColor: Colors.black,
                      iconActiveColor: Colors.black,
                      icon: LineIcons.search,
                      text: 'Search',
                    ),
                    GButton(
                      backgroundColor: Colors.blueAccent,
                      textColor: Colors.black,
                      iconActiveColor: Colors.black,
                      icon: LineIcons.user,
                      text: 'Profile',
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  }),
            ),
        ),
      ),
      );
  }
}