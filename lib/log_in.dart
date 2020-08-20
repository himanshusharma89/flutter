import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tradewinds/dashboard.dart';
import 'package:tradewinds/sign_up.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flushbar/flushbar.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  StreamSubscription<DataConnectionStatus> listener;


  @override
  void dispose() {
    listener.cancel();
    super.dispose();
  }

  checkInternet()async{
    print("The statement 'this machine is connected to the Internet' is: ");
    print(await DataConnectionChecker().hasConnection);
    print("Current status: ${await DataConnectionChecker().connectionStatus}");
    print("Last results: ${DataConnectionChecker().lastTryResults}");
    listener = DataConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case DataConnectionStatus.connected:
          print('Data connection is available.');
          break;
        case DataConnectionStatus.disconnected:
          print('You are disconnected from the internet.');
          break;
      }
  });

  return await DataConnectionChecker().connectionStatus;
  }
  
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30),
            child: Text(
              'Log In',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                fontSize: 26,
              ),
            ),
            
          ),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              color: Color(0XFFFAFAFA),
              border: Border.all(
                color: Color(0XFFDBDBDB),
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                labelText: 'Email',
                hintText: 'Enter your email address',
              ),
            ),
          ),

          SizedBox(height: 20,),

          Container(
            padding: EdgeInsets.only(left: 15, right: 15,),
            decoration: BoxDecoration(
              color: Color(0XFFFAFAFA),
              border: Border.all(
                color: Color(0XFFDBDBDB),
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                labelText: 'Password',
                hintText: 'Enter password',
              ),
            ),
          ),

          SizedBox(height: 20,),

          Container(
            width: double.maxFinite,
            height: 50,
            child: RaisedButton(
          color: Color(0XFF0195f7),
          disabledColor: Color(0XFF0195f7).withOpacity(0.4),
          disabledTextColor: Colors.grey.withOpacity(0.5),
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          onPressed: () async {
            DataConnectionStatus status = await checkInternet();
            if (status == DataConnectionStatus.connected){
                  try{
                     var authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(
                     email: emailController.text, 
                     password: passwordController.text
                     );
                    if (authResult.user != null) {
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TabPage()));
                    } else {
                     print("Unsuccessful!");
                  }
                  } catch(e){
                     print(e);
                  }
                  }else {
                    Flushbar(
                  title: 'No Internet',
                  message: 'Please check your internet connection!',
                  icon: Icon(
                    Icons.info_outline,
                    size: 28,
                    color: Colors.blue[300],
                  ),
                  duration: Duration(seconds: 3),
                  leftBarIndicatorColor: Colors.blue[300],
                )..show(context);
                  // showDialog(
                  //   context: context,
                  //   builder: (context)=> AlertDialog(
                  //     title: Text('No Internet'),
                  //     content: Text('Check your Internet Connection'),
                  //   ) 
                  //    );
                }
                 }, 
           child: Text(
             'Continue',
             style: GoogleFonts.montserrat(
               fontWeight: FontWeight.bold,
             ),
           ),
           ),
          ),
          Container(
            alignment: Alignment.center,
            height: 60,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'New User?',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  TextSpan(
                    text: ' Sign Up',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (BuildContext context) => SignUpScreen()),
                     );
                    },
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              ),
          ),
        ],
      ),
    );
  }
}