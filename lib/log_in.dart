import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tradewinds/dashboard.dart';
import 'package:tradewinds/sign_up.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
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