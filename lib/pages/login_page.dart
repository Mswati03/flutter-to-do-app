

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/pages/forgot_password.dart';
import 'package:todo_app/pages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({Key ? key }): super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth=MediaQuery.of(context).size.width;
    double screenheight=MediaQuery.of(context).size.height;
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
     return Scaffold(
       body: ListView(
         children: [
           const SizedBox(height: 25,),
       Row(

         mainAxisAlignment: MainAxisAlignment.start,
         children : [
           const SizedBox(width: 12,),
           Text(
             'Plan your day\nPlan your tasks, \nPlan your success',
             style: TextStyle(
               color: Colors.black,
               fontSize: 25,
               fontFamily: 'Inter',
               fontWeight: FontWeight.w700,
               height: 0,
             ),
           ),],
       ),
           const SizedBox(height: 10),
           Container(
             width: screenwidth/12,
             height: screenheight/2.5,
             alignment: Alignment.center,
             child : Image.asset('assets/images/register_login.png'),
           ),
           const SizedBox(height: 20),
           Container(
             width: screenwidth/12,
             height: screenheight/9,
             child : Padding(

               padding: EdgeInsets.all(15),
               child: TextField(
                 controller: emailController,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   labelText: 'Email',
                   hintText: 'Enter Your Email',
                 ),
               ),
             ),
           ),
           const SizedBox(height: 10,),
           Container(
             width: screenwidth/12,
             height: screenheight/9,
             child : Padding(
               padding: EdgeInsets.all(15),
               child: TextField(
                 controller: passwordController,
                 obscureText: true,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   labelText: 'Password',
                   hintText: 'Enter Password',
                 ),
               ),
             ),
           ),
           const SizedBox( height: 30),
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

               onPressed: ()  async {
                 showDialog(
                     context: context,
                     builder: (BuildContext context) {
                       return Center(child: CircularProgressIndicator(

                       ),);
                     });
                 try {
                   final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                     email:  emailController.text.toString().trim(),
                     password: passwordController.text,
                   );
                 } on FirebaseAuthException catch (e) {
                   if (e.code == 'user-not-found') {
                     print('No user found for that email.');
                   } else if (e.code == 'wrong-password') {
                     print('Wrong password provided for that user.');
                   }
                 }
                 await loginAction();
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => Home()),
                 );
               },
               child:Text(
                 'Login',
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 25,
                   fontFamily: 'Inter',
                   fontWeight: FontWeight.w700,
                 ),
               ),
             ),
           ),
           const SizedBox(height: 20,),

           Center(
             child :InkWell(
               child: Text("Dont remember your password? click here ->",
                 style: TextStyle(
                   color: Color(0xFF0500FF),
                 ),),
               onTap: () async {
                 showDialog(
                     context: context,
                     builder: (BuildContext context) {
                       return Center(child: CircularProgressIndicator(

                       ),);
                     });
                 await loginAction();
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                 );

               },
             ),
           ),

         ],
       ),
     );
  }
}
Future<bool> loginAction() async {
  //replace the below line of code with your login request
  await new Future.delayed(const Duration(seconds: 2));
  return true;
}