

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/pages/register_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class InitialPage extends StatelessWidget{
  const InitialPage({Key ? key }): super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth=MediaQuery.of(context).size.width;
    double screenheight=MediaQuery.of(context).size.height;
    return
      Scaffold(

        backgroundColor: Colors.white,
        body: ListView(

          clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.all(10),

        children: [

         SizedBox(height: 30,),
         Center(
           heightFactor: screenheight/600,
         child : Text(
           'TASKMASTER',
           style: TextStyle(
             color: Colors.black,
             fontSize: 30,
             fontFamily: 'Inter',
             fontWeight: FontWeight.w900,
           ),
         ),
         ),
         const SizedBox(height: 20,),
         Container(
           width: screenwidth/12,
           height: screenheight/2,
           alignment: Alignment.center,
           child: Image.asset('assets/images/home.png'),
           ),
          const SizedBox(height: 5,),
          Center(
            heightFactor: screenheight/500,

          child : Text(
            'Plan your day\nPlan your tasks, \nPlan your success',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(

              height: screenheight/13,
              decoration: ShapeDecoration(
                color: Color(0xFF0500FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
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
              await loginAction();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Register()),
              );
            },
            child:Text(
              'Get Started',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),
          )
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