
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget{
  const ForgotPasswordPage({Key ? key }): super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth=MediaQuery.of(context).size.width;
    double screenheight=MediaQuery.of(context).size.height;
    return Scaffold(
        body: ListView(
        children: [
        const SizedBox(height: 25,),
          Center(
            child: Text(
            'Recover your account',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          ),
          const SizedBox(height: 10,),
          Container(
            width: screenwidth/12,
            height: screenheight/2.5,
            alignment: Alignment.center,
            child : Image.asset('assets/images/404.jpg'),
          ),
          const SizedBox(height: 20),
          Container(
            width: screenwidth/12,
            height: screenheight/9,
            child : Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter Your Email',
                ),
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Container(
            width: screenwidth/12,
            height: screenheight/10,
            decoration: ShapeDecoration(
              color: Color(0xFF0500FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: TextButton(

              onPressed: () {
                // Respond to button press
              },
              child:Text(
                'Reset Password',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
    ),
    );
  }
}