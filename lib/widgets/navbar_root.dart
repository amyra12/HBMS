import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import the Services library
import '../FilterScreen.dart';
import '../Screens/ActivityScreen.dart';
import '../Screens/AddScreen.dart';
import '../Screens/Home2.dart';

class NavBarRoots extends StatefulWidget {
  @override
  State<NavBarRoots> createState() => _NavBarRootsState();
}

class _NavBarRootsState extends State<NavBarRoots> {
  int _selectedIndex = 0;
  final _screens = [
    Home2(),
    ActivityScreen(beds: []),
    FilterScreen(beds: []),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Close the app when the back button is pressed
        SystemNavigator.pop();
        return true; // It is necessary to return true
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _screens[_selectedIndex],
        bottomNavigationBar: Container(
          height: 80,
          child: BottomNavigationBar(
            backgroundColor: Color(0xFFFFFFFF),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xFF2F348F),
            unselectedItemColor: Colors.black,
            selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });

              // Handle navigation here
              if (index == 0) {
                // Navigate to the HomeScreen and remove all previous routes
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => NavBarRoots()),
                      (route) => false, // Remove all previous routes
                );
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_activity),
                label: "Activity",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
