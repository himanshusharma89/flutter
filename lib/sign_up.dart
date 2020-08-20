import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tradewinds/create_profile.dart';
import 'package:tradewinds/log_in.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flushbar/flushbar.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
class SignUpScreen extends StatefulWidget {

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with TickerProviderStateMixin {
  int _state = 0;
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final passwordValidator = MultiValidator ([
        RequiredValidator(errorText: 'Password is required'),
        MinLengthValidator(8, errorText: 'Password must be at least 8 digits long'),
        PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'Passwords must have at least one special character')
      ]);
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
      body: Form(
        autovalidate: true,
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30),
              child: Text(
                'Create New Account',
                style: GoogleFonts.montserrat(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
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
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: EmailValidator(errorText: 'Enter a valid email address'),
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
              child: TextFormField(
                controller: passwordController,
                validator: passwordValidator,
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

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: new MaterialButton(
                child: setUpButtonChild(),
                onPressed: () async {
              DataConnectionStatus status = await checkInternet();
              if (status == DataConnectionStatus.connected){
                
                if(_formKey.currentState.validate()){
                  setState(() {
                    if (_state == 0) {
                      animateButton();
                    }
                  });
                      try{
                        var authResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: emailController.text, 
                        password: passwordController.text
                        );
                        if (authResult.user != null) {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CreateProfileScreen(emailController.text)));
                        } else {
                        print("Unsuccessful!");
                      }
                      } catch(e){
                        print(e);
                      }
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
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogInScreen()));
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