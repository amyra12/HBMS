import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wsm_app/FilterScreen.dart';
import 'package:wsm_app/Screens/ActivityScreen.dart';
import 'package:wsm_app/Screens/OccupiedScreen.dart';
import 'package:wsm_app/Screens/ReadyScreen.dart';
import 'package:wsm_app/example.dart';
import 'package:wsm_app/widgets/navbar_root.dart';
import 'package:http/http.dart' as http;
import '../Screens/Home2.dart';


class SideMenu extends StatefulWidget{
  @override
  State<SideMenu> createState() => _SideMenuState();
}




class _SideMenuState extends State<SideMenu>{
  String userRole = "";

@override
  void initState() {
    super.initState();

    // You should replace this with the actual logic to get the current user ID after login
    String currentUserId = "123"; // Replace "123" with the actual user ID after login

    // Fetch user role when the widget is initialized with the current user ID
    getUserRole(currentUserId);
  }

  Future<void> getUserRole(String userId) async {
    try {
      String uri = "http://your-api-url.com/getUserRole.php?id=$userId";

      var res = await http.get(Uri.parse(uri));

      var response = jsonDecode(res.body);

      if (response["success"] == true) {
        setState(() {
          userRole = response["role"];
        });
      } else {
        print("User not found.");
      }
    } catch (e) {
      print("Some issue: $e");
    }
  }

  @override
  Widget build(BuildContext context) {


    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF2F348F).withOpacity(0.8),
                  Color(0xFFEC2127).withOpacity(0.8),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Hospital Queen Elizabeth II',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                SizedBox(height: 8),
                Row(
                children: [
                  Text(
                  "Role:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                  SizedBox(width: 5,),
                  Text(
                    userRole,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
            ],
                ),
              ],
            ),
          ),

          Column(
            children: [
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NavBarRoots(),
                ))},
              ),
              Divider(), // Divider line
              ListTile(
                leading: Icon(Icons.check_circle, color: Colors.lightGreen),
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
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout_rounded, color: Colors.purple),
            title: Text("Log Out"),
            onTap: () {
              _showSignOutDialog(context); // Show the sign-out confirmation dialog
            },
          ),

        ],
      ),
    );
  }
}

Future<void> _showSignOutDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Confirm Sign Out"),
        content: Text("Are you sure you want to sign out?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              await AuthService.signOut(); // Perform sign-out
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text("Sign Out"),
          ),
        ],
      );
    },
  );
}


class AuthService {
  // Example: Replace with actual authentication logic

  static Future<bool> signIn(String email, String password) async {
    // Simulate sign-in logic
    // Replace with your actual sign-in logic, e.g., Firebase authentication
    await Future.delayed(Duration(seconds: 2));
    return true; // Return true if sign-in is successful, false otherwise
  }

  static Future<void> signOut() async {
   // await Future.delayed(Duration(seconds: 2));
   // print('User signed out');
    SystemNavigator.pop();
  }

  static Future<bool> isUserAuthenticated() async {
    // Simulate checking authentication state
    // Replace with your actual authentication state-checking logic
    await Future.delayed(Duration(seconds: 2));
    return false; // Return true if the user is authenticated, false otherwise
  }



  static Future<void> _performSignOut(BuildContext context) async {
    await signOut(); // Sign out logic
    // Additional logic can be added here, such as navigating to a sign-out screen
  }

  static Future<void> signOutAndExit(BuildContext context) async {
    await _showSignOutDialog(context); // Show the confirmation dialog before signing out
  }
}