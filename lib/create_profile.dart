import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tradewinds/dashboard.dart';
import 'package:tradewinds/log_in.dart';

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
            padding: EdgeInsets.only(bottom: 50),
            child: Text(
              'Create Profile',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
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
                  // this is what happens when click the button in on the create profile screen
                    // this is storing the data to the firebase document 
                    var dataObject = {
                   "fullName": fullNameController.text,
                   "phone": phoneNumberController.text,
                   "address": addressController.text,
                   "email": emailAddress,
                  };
                   await Firestore().collection("Users").document(emailAddress).setData(dataObject); 
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (BuildContext context) => TabPage()),
                     );
                
                  },
              child: Text(
                'Continue',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                )
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