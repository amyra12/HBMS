
import 'package:flutter/material.dart';

import '../FilterScreen.dart';
import '../Screens/ActivityScreen.dart';
import '../Screens/Home2.dart';

class NavBarAdmin extends StatefulWidget {
  @override
  State<NavBarAdmin> createState() => _NavBarAdminState();
}

class _NavBarAdminState extends State<NavBarAdmin> {
  int _selectedIndex = 0;
  final _screens = [
    //HomeScreen(),
    Home2(),
    ActivityScreen(beds: []),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              // Navigate to the HomeScreen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NavBarAdmin()),

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
    );
  }
}
