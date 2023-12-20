import 'package:flutter/material.dart';
import 'package:wsm_app/Screens/Login.dart';

import '../widgets/navbar_root.dart';

class WelcomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column (
            children: [
              SizedBox(height: 30),
              Align(alignment: Alignment.centerRight,
               child: TextButton(
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NavBarRoots()
                     ));
                },
                 child: Text("SKIP",
                 style: TextStyle(
                   color: Color(0xFF2F348F),
                       fontSize: 20,
                 ),
                 ),
              ),
              ),
              SizedBox(height: 20),
              Padding(padding: EdgeInsets.all(30),
                child: Image.asset("assets/WMS.png"),
              ),
              SizedBox(height: 10),
              Text("Ward Management System",
              style: TextStyle(
                color: Color(0xFF2F348F),
                fontFamily: 'RobotoRegular',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                //letterSpacing: 1,
                //wordSpacing: 1,
              ),
              ),
              SizedBox(height: 10),
              Text("Your Comfort, Our Responsibilities",
                style: TextStyle(
                  color: Color(0xFFEC2127),
                  fontFamily: 'RobotoRegular',
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  //letterSpacing: 1,
                  //wordSpacing: 1,
                ),
              ),
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Material(
                    color: Color(0xFF2F348F),
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()
                        ));
                      },
                      child: Padding(padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                        child: Text("Log In",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontFamily: 'RobotoRegular',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        )
                      ),
                    ),
                  ),
          
          
                ],
              )
            ],
          ),
        )
      )
    );
  }
  
}