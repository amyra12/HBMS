import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:badges/badges.dart' as badges;
import 'package:wsm_app/1Floor/FirstFloor.dart';
import 'package:wsm_app/GFloor/WARD/W2G.dart';
import 'package:wsm_app/dropdown.dart';
import '../GFloor/Ward1G.dart';
import '../GFloor/Ward1G.dart';

import '../GFloor/WARD/W1G.dart';
import '../widgets/sidemenu.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

    // TODO: implement build
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: SideMenu(),
        appBar: AppBar(
          title: Text(" ",
            style: TextStyle(
                color: Color(0xFF2F348F),
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF2F348F).withOpacity(0.8),
                  Color(0xFFEC2127).withOpacity(0.8),], // Replace with your desired gradient colors
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.headset_mic, color: Colors.white), // Use your desired icon
              onPressed: () {
                // Add your customer service button action here
                // For example, you can open a customer service screen or show a dialog
                print("Customer service button pressed");
              },
            ),
          ],

        ),
        body: RefreshIndicator(
          onRefresh: () async {
          // Implement your refresh logic here
          print("Pull-to-refresh initiated");
          // You can call your async function to refresh data here
          },

          child: Container(

          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                //height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.all(10),
                //width: 400, // Adjust the width as needed
                height: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,

                    colors: [
                      Color(0xFF2F348F).withOpacity(0.8),
                      Color(0xFFEC2127).withOpacity(0.8),
                    ],

                  ),

                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(80),
                    bottomRight: Radius.circular(0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Hospital Bed',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Management System',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Container(


                // Your first additional container
                height: 40,
                width: 100, // Adjust the width as needed
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(
                    'Level',
                    style: TextStyle(
                      color: Color(0xFF2F348F),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
                ),
              ),

              Expanded(
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.all(30),
                  children: [
                    GridView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                      ),

                        children: [


                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Ward()),
                              );
                            },
                            child: badges.Badge(
                              position: badges.BadgePosition.topEnd(top: -10, end: -12),
                              showBadge: true,
                              ignorePointer: false,
                              onTap: () {},
                              badgeContent: Text(
                                '1',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              badgeAnimation: badges.BadgeAnimation.rotation(
                                animationDuration: Duration(seconds: 1),
                                colorChangeAnimationDuration: Duration(seconds: 1),
                                loopAnimation: false,
                                curve: Curves.fastOutSlowIn,
                                colorChangeAnimationCurve: Curves.easeInCubic,
                              ),
                              badgeStyle: badges.BadgeStyle(
                                shape: badges.BadgeShape.circle,
                                badgeColor: Colors.orange,
                                padding: EdgeInsets.all(8),
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(color: Colors.white, width: 2),
                                borderGradient: badges.BadgeGradient.linear(
                                  colors: [Colors.red, Color(0xFF2F348F)],
                                ),
                                badgeGradient: badges.BadgeGradient.linear(
                                  colors: [Colors.orange, Colors.deepOrange],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                elevation: 0,
                              ),
                            child: Container(

                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color(0xFF2F348F),
                                  width: 2.0,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF2F348F).withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: Offset(3, 3),
                                  ),
                                ],
                              ),

                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: AssetImage('assets/level.png'),  // Replace with the actual path to your image
                                      width: 40,  // Set the width of the image as needed
                                      height: 40, // Set the height of the image as needed
                                    ),
                                    Text(
                                      'GF',
                                      style: TextStyle(
                                        color: Color(0xFF2F348F),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => WardFirst()),
                              );
                            },
                            child: badges.Badge(
                              position: badges.BadgePosition.topEnd(top: -10, end: -12),
                              showBadge: true,
                              ignorePointer: false,
                              onTap: () {},
                              badgeContent: Text(
                                '1',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              badgeAnimation: badges.BadgeAnimation.rotation(
                                animationDuration: Duration(seconds: 1),
                                colorChangeAnimationDuration: Duration(seconds: 1),
                                loopAnimation: false,
                                curve: Curves.fastOutSlowIn,
                                colorChangeAnimationCurve: Curves.easeInCubic,
                              ),
                              badgeStyle: badges.BadgeStyle(
                                shape: badges.BadgeShape.circle,
                                badgeColor: Colors.orange,
                                padding: EdgeInsets.all(8),
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(color: Colors.white, width: 2),
                                borderGradient: badges.BadgeGradient.linear(
                                  colors: [Colors.red, Color(0xFF2F348F)],
                                ),
                                badgeGradient: badges.BadgeGradient.linear(
                                  colors: [Colors.orange, Colors.deepOrange],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                elevation: 0,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Color(0xFF2F348F),
                                    width: 2.0,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF2F348F).withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(3, 3),
                                    ),
                                  ],
                                ),

                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(
                                        image: AssetImage('assets/level.png'),  // Replace with the actual path to your image
                                        width: 40,  // Set the width of the image as needed
                                        height: 40, // Set the height of the image as needed
                                      ),
                                      Text(
                                        '1',
                                        style: TextStyle(
                                          color: Color(0xFF2F348F),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Ward()),
                              );
                            },
                            child: badges.Badge(
                              position: badges.BadgePosition.topEnd(top: -10, end: -12),
                              showBadge: true,
                              ignorePointer: false,
                              onTap: () {},
                              badgeContent: Text(
                                '1',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              badgeAnimation: badges.BadgeAnimation.rotation(
                                animationDuration: Duration(seconds: 1),
                                colorChangeAnimationDuration: Duration(seconds: 1),
                                loopAnimation: false,
                                curve: Curves.fastOutSlowIn,
                                colorChangeAnimationCurve: Curves.easeInCubic,
                              ),
                              badgeStyle: badges.BadgeStyle(
                                shape: badges.BadgeShape.circle,
                                badgeColor: Colors.orange,
                                padding: EdgeInsets.all(8),
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(color: Colors.white, width: 2),
                                borderGradient: badges.BadgeGradient.linear(
                                  colors: [Colors.red, Color(0xFF2F348F)],
                                ),
                                badgeGradient: badges.BadgeGradient.linear(
                                  colors: [Colors.orange, Colors.deepOrange],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                elevation: 0,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Color(0xFF2F348F),
                                    width: 2.0,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF2F348F).withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(3, 3),
                                    ),
                                  ],
                                ),

                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(
                                        image: AssetImage('assets/level.png'),  // Replace with the actual path to your image
                                        width: 40,  // Set the width of the image as needed
                                        height: 40, // Set the height of the image as needed
                                      ),
                                      Text(
                                        '2',
                                        style: TextStyle(
                                          color: Color(0xFF2F348F),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Ward()),
                              );
                            },
                            child: badges.Badge(
                              position: badges.BadgePosition.topEnd(top: -10, end: -12),
                              showBadge: true,
                              ignorePointer: false,
                              onTap: () {},
                              badgeContent: Text(
                                '1',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              badgeAnimation: badges.BadgeAnimation.rotation(
                                animationDuration: Duration(seconds: 1),
                                colorChangeAnimationDuration: Duration(seconds: 1),
                                loopAnimation: false,
                                curve: Curves.fastOutSlowIn,
                                colorChangeAnimationCurve: Curves.easeInCubic,
                              ),
                              badgeStyle: badges.BadgeStyle(
                                shape: badges.BadgeShape.circle,
                                badgeColor: Colors.orange,
                                padding: EdgeInsets.all(8),
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(color: Colors.white, width: 2),
                                borderGradient: badges.BadgeGradient.linear(
                                  colors: [Colors.red, Color(0xFF2F348F)],
                                ),
                                badgeGradient: badges.BadgeGradient.linear(
                                  colors: [Colors.orange, Colors.deepOrange],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                elevation: 0,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Color(0xFF2F348F),
                                    width: 2.0,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF2F348F).withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(3, 3),
                                    ),
                                  ],
                                ),

                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(
                                        image: AssetImage('assets/level.png'),  // Replace with the actual path to your image
                                        width: 40,  // Set the width of the image as needed
                                        height: 40, // Set the height of the image as needed
                                      ),
                                      Text(
                                        '3',
                                        style: TextStyle(
                                          color: Color(0xFF2F348F),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Ward()),
                              );
                            },
                            child: badges.Badge(
                              position: badges.BadgePosition.topEnd(top: -10, end: -12),
                              showBadge: true,
                              ignorePointer: false,
                              onTap: () {},
                              badgeContent: Text(
                                '1',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              badgeAnimation: badges.BadgeAnimation.rotation(
                                animationDuration: Duration(seconds: 1),
                                colorChangeAnimationDuration: Duration(seconds: 1),
                                loopAnimation: false,
                                curve: Curves.fastOutSlowIn,
                                colorChangeAnimationCurve: Curves.easeInCubic,
                              ),
                              badgeStyle: badges.BadgeStyle(
                                shape: badges.BadgeShape.circle,
                                badgeColor: Colors.orange,
                                padding: EdgeInsets.all(8),
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(color: Colors.white, width: 2),
                                borderGradient: badges.BadgeGradient.linear(
                                  colors: [Colors.red, Color(0xFF2F348F)],
                                ),
                                badgeGradient: badges.BadgeGradient.linear(
                                  colors: [Colors.orange, Colors.deepOrange],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                elevation: 0,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Color(0xFF2F348F),
                                    width: 2.0,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF2F348F).withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(3, 3),
                                    ),
                                  ],
                                ),

                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(
                                        image: AssetImage('assets/level.png'),  // Replace with the actual path to your image
                                        width: 40,  // Set the width of the image as needed
                                        height: 40, // Set the height of the image as needed
                                      ),
                                      Text(
                                        '4',
                                        style: TextStyle(
                                          color: Color(0xFF2F348F),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Ward()),
                              );
                            },
                            child: badges.Badge(
                              position: badges.BadgePosition.topEnd(top: -10, end: -12),
                              showBadge: true,
                              ignorePointer: false,
                              onTap: () {},
                              badgeContent: Text(
                                '1',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              badgeAnimation: badges.BadgeAnimation.rotation(
                                animationDuration: Duration(seconds: 1),
                                colorChangeAnimationDuration: Duration(seconds: 1),
                                loopAnimation: false,
                                curve: Curves.fastOutSlowIn,
                                colorChangeAnimationCurve: Curves.easeInCubic,
                              ),
                              badgeStyle: badges.BadgeStyle(
                                shape: badges.BadgeShape.circle,
                                badgeColor: Colors.orange,
                                padding: EdgeInsets.all(8),
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(color: Colors.white, width: 2),
                                borderGradient: badges.BadgeGradient.linear(
                                  colors: [Colors.red, Color(0xFF2F348F)],
                                ),
                                badgeGradient: badges.BadgeGradient.linear(
                                  colors: [Colors.orange, Colors.deepOrange],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                elevation: 0,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Color(0xFF2F348F),
                                    width: 2.0,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF2F348F).withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(3, 3),
                                    ),
                                  ],
                                ),

                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(
                                        image: AssetImage('assets/level.png'),  // Replace with the actual path to your image
                                        width: 40,  // Set the width of the image as needed
                                        height: 40, // Set the height of the image as needed
                                      ),
                                      Text(
                                        '5',
                                        style: TextStyle(
                                          color: Color(0xFF2F348F),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Ward()),
                              );
                            },
                            child: badges.Badge(
                              position: badges.BadgePosition.topEnd(top: -10, end: -12),
                              showBadge: true,
                              ignorePointer: false,
                              onTap: () {},
                              badgeContent: Text(
                                '1',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              badgeAnimation: badges.BadgeAnimation.rotation(
                                animationDuration: Duration(seconds: 1),
                                colorChangeAnimationDuration: Duration(seconds: 1),
                                loopAnimation: false,
                                curve: Curves.fastOutSlowIn,
                                colorChangeAnimationCurve: Curves.easeInCubic,
                              ),
                              badgeStyle: badges.BadgeStyle(
                                shape: badges.BadgeShape.circle,
                                badgeColor: Colors.orange,
                                padding: EdgeInsets.all(8),
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(color: Colors.white, width: 2),
                                borderGradient: badges.BadgeGradient.linear(
                                  colors: [Colors.red, Color(0xFF2F348F)],
                                ),
                                badgeGradient: badges.BadgeGradient.linear(
                                  colors: [Colors.orange, Colors.deepOrange],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                elevation: 0,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Color(0xFF2F348F),
                                    width: 2.0,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF2F348F).withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(3, 3),
                                    ),
                                  ],
                                ),

                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(
                                        image: AssetImage('assets/level.png'),  // Replace with the actual path to your image
                                        width: 40,  // Set the width of the image as needed
                                        height: 40, // Set the height of the image as needed
                                      ),
                                      Text(
                                        '6',
                                        style: TextStyle(
                                          color: Color(0xFF2F348F),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Ward()),
                              );
                            },
                            child: badges.Badge(
                              position: badges.BadgePosition.topEnd(top: -10, end: -12),
                              showBadge: true,
                              ignorePointer: false,
                              onTap: () {},
                              badgeContent: Text(
                                '1',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              badgeAnimation: badges.BadgeAnimation.rotation(
                                animationDuration: Duration(seconds: 1),
                                colorChangeAnimationDuration: Duration(seconds: 1),
                                loopAnimation: false,
                                curve: Curves.fastOutSlowIn,
                                colorChangeAnimationCurve: Curves.easeInCubic,
                              ),
                              badgeStyle: badges.BadgeStyle(
                                shape: badges.BadgeShape.circle,
                                badgeColor: Colors.orange,
                                padding: EdgeInsets.all(8),
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(color: Colors.white, width: 2),
                                borderGradient: badges.BadgeGradient.linear(
                                  colors: [Colors.red, Color(0xFF2F348F)],
                                ),
                                badgeGradient: badges.BadgeGradient.linear(
                                  colors: [Colors.orange, Colors.deepOrange],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                elevation: 0,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Color(0xFF2F348F),
                                    width: 2.0,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF2F348F).withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(3, 3),
                                    ),
                                  ],
                                ),

                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(
                                        image: AssetImage('assets/level.png'),  // Replace with the actual path to your image
                                        width: 40,  // Set the width of the image as needed
                                        height: 40, // Set the height of the image as needed
                                      ),
                                      Text(
                                        '7',
                                        style: TextStyle(
                                          color: Color(0xFF2F348F),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Ward()),
                              );
                            },
                            child: badges.Badge(
                              position: badges.BadgePosition.topEnd(top: -10, end: -12),
                              showBadge: true,
                              ignorePointer: false,
                              onTap: () {},
                              badgeContent: Text(
                                '1',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              badgeAnimation: badges.BadgeAnimation.rotation(
                                animationDuration: Duration(seconds: 1),
                                colorChangeAnimationDuration: Duration(seconds: 1),
                                loopAnimation: false,
                                curve: Curves.fastOutSlowIn,
                                colorChangeAnimationCurve: Curves.easeInCubic,
                              ),
                              badgeStyle: badges.BadgeStyle(
                                shape: badges.BadgeShape.circle,
                                badgeColor: Colors.orange,
                                padding: EdgeInsets.all(8),
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(color: Colors.white, width: 2),
                                borderGradient: badges.BadgeGradient.linear(
                                  colors: [Colors.red, Color(0xFF2F348F)],
                                ),
                                badgeGradient: badges.BadgeGradient.linear(
                                  colors: [Colors.orange, Colors.deepOrange],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                elevation: 0,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Color(0xFF2F348F),
                                    width: 2.0,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF2F348F).withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(3, 3),
                                    ),
                                  ],
                                ),

                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(
                                        image: AssetImage('assets/level.png'),  // Replace with the actual path to your image
                                        width: 40,  // Set the width of the image as needed
                                        height: 40, // Set the height of the image as needed
                                      ),
                                      Text(
                                        '8',
                                        style: TextStyle(
                                          color: Color(0xFF2F348F),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Ward()),
                              );
                            },
                            child: badges.Badge(
                              position: badges.BadgePosition.topEnd(top: -10, end: -12),
                              showBadge: true,
                              ignorePointer: false,
                              onTap: () {},
                              badgeContent: Text(
                                '1',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              badgeAnimation: badges.BadgeAnimation.rotation(
                                animationDuration: Duration(seconds: 1),
                                colorChangeAnimationDuration: Duration(seconds: 1),
                                loopAnimation: false,
                                curve: Curves.fastOutSlowIn,
                                colorChangeAnimationCurve: Curves.easeInCubic,
                              ),
                              badgeStyle: badges.BadgeStyle(
                                shape: badges.BadgeShape.circle,
                                badgeColor: Colors.orange,
                                padding: EdgeInsets.all(8),
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(color: Colors.white, width: 2),
                                borderGradient: badges.BadgeGradient.linear(
                                  colors: [Colors.red, Color(0xFF2F348F)],
                                ),
                                badgeGradient: badges.BadgeGradient.linear(
                                  colors: [Colors.orange, Colors.deepOrange],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                elevation: 0,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Color(0xFF2F348F),
                                    width: 2.0,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF2F348F).withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(3, 3),
                                    ),
                                  ],
                                ),

                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(
                                        image: AssetImage('assets/level.png'),  // Replace with the actual path to your image
                                        width: 40,  // Set the width of the image as needed
                                        height: 40, // Set the height of the image as needed
                                      ),
                                      Text(
                                        '9',
                                        style: TextStyle(
                                          color: Color(0xFF2F348F),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )

          ],
        ),
    ),
    ),
      )
    );
    }

}




