import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tradewinds/dashboard.dart';
import 'package:tradewinds/log_in.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateProfileScreen extends StatefulWidget {
  final String email;
  CreateProfileScreen(this.email);
  
  
  @override
  _CreateProfileScreenState createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
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
          onPressed:
            
           () async {
                    var dataObject = {
                   "fullName": fullNameController.text,
                   "phone": phoneNumberController.text,
                   "address": addressController.text,
                   "email": emailAddress,
                  };
                   await Firestore().collection("Users").document(emailAddress).setData(dataObject); 
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TabPage()));
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
}