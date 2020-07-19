import 'package:reveal_search_bar/RevealSearchBar.dart';
import 'package:flutter/material.dart';



class searchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TradeWinds',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.amber,
        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: seachBar(title: 'TradeWinds'),
    );
  }
}

class seachBar extends StatefulWidget {
  seachBar({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _seachBarState createState() => _seachBarState();
}

class _seachBarState extends State<seachBar> {
  TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RevealAppBar(
        searchController: controller,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
        ),
      ),
      
    );
  }
}