import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 35.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image(
                    width: 150.0,
                    height:150.0,
                    image: AssetImage('assets/images/app_icon.png')
                  ),
  //------------------------------------TITLE-------------------------------//
                  SizedBox(height: 20.0,),
                  Text(
                    'TRADEWINDS',
                    style:TextStyle(
                      fontSize: 30.0,
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                    ),

  //--------------------------------------Version------------------------------//
                  SizedBox(height: 10.0,),
                  Text(
                    'VERSION: 1.0.0+1',
                    style:TextStyle(
                      fontSize: 15.0,
                      color: Theme.of(context).primaryColor,
                    ),
                    ),

  //-----------------------------------Copyright----------------------------------//
                  SizedBox(height: 10.0,),
                  Text(
                    '\u00a9 2020, GirlScript Organization',
                    style:TextStyle(
                      fontSize: 15.0,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                ],
              ),
            ],
          ),
        ),
        ),
    );
  }
}