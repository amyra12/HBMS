import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import '../GFloor/WARD/W10G.dart';
import '../GFloor/WARD/W2G.dart';
import '../GFloor/WARD/W3G.dart';
import '../GFloor/WARD/W4G.dart';
import '../GFloor/WARD/W5G.dart';
import '../GFloor/WARD/W6G.dart';
import '../GFloor/WARD/W7G.dart';
import '../GFloor/WARD/W8G.dart';
import '../GFloor/WARD/W9G.dart';
import '../widgets/navbar_root.dart';


class WardFirst extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //drawer: SideMenu(),
        appBar: AppBar(
          title: Text(" ",
            style: TextStyle(
              color: Color(0xFF2F348F),
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NavBarRoots(),
                    ),
                  );
                },
              );
            },
          ),
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
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
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
                  /*boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],*/
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(80),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      'Level  ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      'First Floor',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ],
                ),
              ),



              Expanded(
                  child: MediaQuery.removePadding(context: context,
                      child: ListView(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => GWard2()), // Replace NextPage with your desired page
                              );
                            },
                            child: badges.Badge(
                              position: badges.BadgePosition.topEnd(top: -10, end: 3),
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
                                height: 100,
                                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.deepPurpleAccent, // Specify the border color here
                                      width: 2.0,           // Specify the border width here
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black38.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: Offset(3, 3),
                                      ),
                                    ],// Apply radius of 10
                                  ),
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    top: 10,
                                    bottom: 5,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[

                                      Text(
                                        "Ward 1",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Bed available: ",
                                              style: TextStyle(
                                                color: Colors.deepPurple,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "5",
                                              style: TextStyle(
                                                color: Colors.deepPurple,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),

                                          ]

                                      )

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
                                MaterialPageRoute(builder: (context) => GWard2()), // Replace NextPage with your desired page
                              );
                            },
                            child: badges.Badge(
                              position: badges.BadgePosition.topEnd(top: -10, end: 3),
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
                                height: 100,
                                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.deepPurpleAccent, // Specify the border color here
                                      width: 2.0,           // Specify the border width here
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black38.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: Offset(3, 3),
                                      ),
                                    ],// Apply radius of 10
                                  ),
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    top: 10,
                                    bottom: 5,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Ward 2",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Bed available: ",
                                              style: TextStyle(
                                                color: Colors.deepPurple,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "5 ",
                                              style: TextStyle(
                                                color: Colors.deepPurple,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),

                                          ]

                                      )

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
                                MaterialPageRoute(builder: (context) => GWard3()), // Replace NextPage with your desired page
                              );
                            },
                            child: badges.Badge(
                              position: badges.BadgePosition.topEnd(top: -10, end: 3),
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
                                height: 100,
                                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.deepPurpleAccent, // Specify the border color here
                                      width: 2.0,           // Specify the border width here
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black38.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: Offset(3, 3),
                                      ),
                                    ],// Apply radius of 10
                                  ),
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    top: 10,
                                    bottom: 5,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Ward 3",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Bed available: ",
                                              style: TextStyle(
                                                color: Colors.deepPurple,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "5 ",
                                              style: TextStyle(
                                                color: Colors.deepPurple,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),

                                          ]

                                      )

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
                                MaterialPageRoute(builder: (context) => GWard4()), // Replace NextPage with your desired page
                              );
                            },
                            child: badges.Badge(
                              position: badges.BadgePosition.topEnd(top: -10, end: 3),
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
                                height: 100,
                                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.deepPurpleAccent, // Specify the border color here
                                      width: 2.0,           // Specify the border width here
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black38.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: Offset(3, 3),
                                      ),
                                    ],// Apply radius of 10
                                  ),
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    top: 10,
                                    bottom: 5,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Ward 4",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Bed available: ",
                                              style: TextStyle(
                                                color: Colors.deepPurple,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "5 ",
                                              style: TextStyle(
                                                color: Colors.deepPurple,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),

                                          ]

                                      )

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
                                MaterialPageRoute(builder: (context) => GWard5()), // Replace NextPage with your desired page
                              );
                            },
                            child: badges.Badge(
                              position: badges.BadgePosition.topEnd(top: -10, end: 3),
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
                                height: 100,
                                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.deepPurpleAccent, // Specify the border color here
                                      width: 2.0,           // Specify the border width here
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black38.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: Offset(3, 3),
                                      ),
                                    ],// Apply radius of 10
                                  ),
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    top: 10,
                                    bottom: 5,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Ward 5",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Bed available: ",
                                              style: TextStyle(
                                                color: Colors.deepPurple,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "5 ",
                                              style: TextStyle(
                                                color: Colors.deepPurple,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),

                                          ]

                                      )

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
                                MaterialPageRoute(builder: (context) => GWard6()), // Replace NextPage with your desired page
                              );
                            },
                            child: badges.Badge(
                              position: badges.BadgePosition.topEnd(top: -10, end: 3),
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
                                height: 100,
                                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.deepPurpleAccent, // Specify the border color here
                                      width: 2.0,           // Specify the border width here
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black38.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: Offset(3, 3),
                                      ),
                                    ],// Apply radius of 10
                                  ),
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    top: 10,
                                    bottom: 5,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Ward 6",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Bed available: ",
                                              style: TextStyle(
                                                color: Colors.deepPurple,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "5 ",
                                              style: TextStyle(
                                                color: Colors.deepPurple,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),

                                          ]

                                      )

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
                                MaterialPageRoute(builder: (context) => GWard7()), // Replace NextPage with your desired page
                              );
                            },
                            child: badges.Badge(
                              position: badges.BadgePosition.topEnd(top: -10, end: 3),
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
                                height: 100,
                                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.deepPurpleAccent, // Specify the border color here
                                      width: 2.0,           // Specify the border width here
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black38.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: Offset(3, 3),
                                      ),
                                    ],// Apply radius of 10
                                  ),
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    top: 10,
                                    bottom: 5,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Ward 7",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Bed available: ",
                                              style: TextStyle(
                                                color: Colors.deepPurple,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "5 ",
                                              style: TextStyle(
                                                color: Colors.deepPurple,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),

                                          ]

                                      )

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
                                MaterialPageRoute(builder: (context) => GWard8()), // Replace NextPage with your desired page
                              );
                            },
                            child: badges.Badge(
                              position: badges.BadgePosition.topEnd(top: -10, end: 3),
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
                                height: 100,
                                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.deepPurpleAccent, // Specify the border color here
                                      width: 2.0,           // Specify the border width here
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black38.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: Offset(3, 3),
                                      ),
                                    ],// Apply radius of 10
                                  ),
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    top: 10,
                                    bottom: 5,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Ward 8",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Bed available: ",
                                              style: TextStyle(
                                                color: Colors.deepPurple,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "5 ",
                                              style: TextStyle(
                                                color: Colors.deepPurple,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),

                                          ]

                                      )

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
                                MaterialPageRoute(builder: (context) => GWard9()), // Replace NextPage with your desired page
                              );
                            },
                            child: badges.Badge(
                              position: badges.BadgePosition.topEnd(top: -10, end: 3),
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
                                height: 100,
                                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.deepPurpleAccent, // Specify the border color here
                                      width: 2.0,           // Specify the border width here
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black38.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: Offset(3, 3),
                                      ),
                                    ],// Apply radius of 10
                                  ),
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    top: 10,
                                    bottom: 5,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Ward 9",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Bed available: ",
                                              style: TextStyle(
                                                color: Colors.deepPurple,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "5 ",
                                              style: TextStyle(
                                                color: Colors.deepPurple,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),

                                          ]

                                      )

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
                                MaterialPageRoute(builder: (context) => GWard10()), // Replace NextPage with your desired page
                              );
                            },
                            child: badges.Badge(
                              position: badges.BadgePosition.topEnd(top: -10, end: 3),
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
                                height: 100,
                                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.deepPurpleAccent, // Specify the border color here
                                      width: 2.0,           // Specify the border width here
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black38.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: Offset(3, 3),
                                      ),
                                    ],// Apply radius of 10
                                  ),
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    top: 10,
                                    bottom: 5,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Ward 10",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Bed available: ",
                                              style: TextStyle(
                                                color: Colors.deepPurple,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "5 ",
                                              style: TextStyle(
                                                color: Colors.deepPurple,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),

                                          ]

                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ),

                          ),
                        ],
                      )
                  )
              )
            ],
          ),
        )
    );
  }

}