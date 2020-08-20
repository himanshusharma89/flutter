import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tradewinds/dashboard.dart';
import 'package:tradewinds/log_in.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flushbar/flushbar.dart';

class CreateProfileScreen extends StatefulWidget {

  final String email;
  CreateProfileScreen(this.email);
  
  
  @override
  _CreateProfileScreenState createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> with TickerProviderStateMixin{
  int _state=0;
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
    TextEditingController fullNameController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    final emailAddress = widget.email;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30),
            child: Text(
              'Create Profile',
              style: GoogleFonts.montserrat(
                fontSize: 26,
                fontWeight: FontWeight.w500,
              )
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
              controller: fullNameController,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                labelText: 'Full Name',
                hintText: 'Enter your name',
              ),
            ),
          ),

          SizedBox(height: 20,),

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
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              labelText: 'Phone Number',
              hintText: 'Enter your phone number',
              ),
            ),
          ),

          SizedBox(height: 20,),

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
              controller: addressController,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                labelText: 'Address',
                hintText: 'Enter your address',
              ),
            ),
          ),

          SizedBox(height: 20,),

          Padding(
              padding: const EdgeInsets.all(16.0),
              child: new MaterialButton(
                child: setUpButtonChild(),
                onPressed: () async {
              DataConnectionStatus status = await checkInternet();
              if (status == DataConnectionStatus.connected){
                setState(() {
                    if (_state == 0) {
                      animateButton();
                    }
                  });
                    var dataObject = {
                   "fullName": fullNameController.text,
                   "phone": phoneNumberController.text,
                   "address": addressController.text,
                   "email": emailAddress,
                  };
                   await Firestore().collection("Users").document(emailAddress).setData(dataObject); 
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TabPage()));
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

                    }
            },
                elevation: 4.0,
                minWidth: double.infinity,
                height: 48.0,
                color: Color(0XFF0195f7),
              ),
            ),

          Container(
            alignment: Alignment.center,
            height: 60,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Already have an account?',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  TextSpan(
                    text: ' Log In',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (BuildContext context) => LogInScreen()),
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
  Widget setUpButtonChild() {
  if (_state == 0) {
    return new Text(
              'Continue',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            );
  } else if (_state == 1) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
    );
  } else {
    return Icon(Icons.check, color: Colors.white);
  }
  }

  void animateButton() {
  setState(() {
    _state = 1;
  });

  Timer(Duration(milliseconds: 3300), () {
    setState(() {
      _state = 2;
    });
  });
  }
}