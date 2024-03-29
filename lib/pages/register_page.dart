
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatelessWidget{
  const Register({Key ? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
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
             obscureText: true,
             controller: passwordController,
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

             onPressed: () async {

                 showDialog(
                     context: context,
                     builder: (BuildContext context) {
                       return Center(child: CircularProgressIndicator(

                       ),);
                     });
                 try {
                   UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                     email:  emailController.text.toString().trim(),
                     password: passwordController.text,
                   );
                   print(emailController.text.toString().trim());
                   print('yess');
                 } catch (e) {
                   print(e);
                 }
                 await loginAction();
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => const LoginPage()),
                 );
               },// Respond to button press

             child:Text(
               'Register',
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
                 child: Text("Already have an account? Login here ->",
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
                     MaterialPageRoute(builder: (context) => const LoginPage()),
                   );
                 },
               ),
             ),
          const SizedBox(height: 30,),


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