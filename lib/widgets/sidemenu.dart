import 'package:flutter/material.dart';
import 'package:wsm_app/FilterScreen.dart';
import 'package:wsm_app/Screens/ActivityScreen.dart';
import 'package:wsm_app/Screens/OccupiedScreen.dart';
import 'package:wsm_app/Screens/ReadyScreen.dart';
import 'package:wsm_app/widgets/navbar_root.dart';

class SideMenu extends StatefulWidget{
  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu>{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              child: Text('Hospital Queen Elizabeth II',
                style: TextStyle(color: Colors.white, fontSize: 25)),
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
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                  color: Color(0xFF2F348F),
                  image: DecorationImage(
                   fit: BoxFit.fill, image: AssetImage("assets/Hospital-Q2.jpg"),
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.7), // Adjust the opacity here (0.0 to 1.0)
                      BlendMode.srcOver,
                    ),
                  )
                  ),
                 ),
          Column(
            children: [
              ListTile(
                leading: Icon(Icons.filter_alt_sharp),
                title: Text("Label"),
                onTap: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FilterScreen(beds: []))),
                },
              ),
              Divider(), // Divider line
              ListTile(
                leading: Icon(Icons.check_circle, color: Colors.lightGreenAccent),
                title: Text("Ready"),
                onTap: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ReadyScreen(beds: []))),
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.event_busy_rounded, color: Colors.red),
                title: Text("Occupied"),
                onTap: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OccupiedScreen())),
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.cleaning_services_rounded, color: Colors.orange),
                title: Text("Carbolize"),
                onTap: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ActivityScreen(beds: []))),
                },
              ),
            ],
          )

        ],
      ),
    );
  }
}