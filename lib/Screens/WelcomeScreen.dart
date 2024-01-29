import 'package:flutter/material.dart';
import 'package:wsm_app/Screens/Login.dart';

class WelcomeScreen extends StatefulWidget {
  final String title;

  const WelcomeScreen({required this.title});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _textFadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _textFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();

    // Listen for animation completion
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Navigate to LoginScreen after animation completion
        _animationController.dispose(); // Optional: Dispose the controller
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                  //  _animationController.dispose(); // Optional: Dispose the controller
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "SKIP",
                    style: TextStyle(
                      color: Color(0xFF2F348F),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              FadeTransition(
                opacity: _fadeAnimation,
                child: Padding(
                  padding: EdgeInsets.all(50),
                  child: Image.asset("assets/WMS.png"),
                ),
              ),
              SizedBox(height: 10),
              FadeTransition(
                opacity: _textFadeAnimation,
                child: Text(
                  "Ward Management System",
                  style: TextStyle(
                    color: Color(0xFF2F348F),
                    fontFamily: 'RobotoRegular',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              FadeTransition(
                opacity: _textFadeAnimation,
                child: Text(
                  "Your Comfort, Our Responsibilities",
                  style: TextStyle(
                    color: Color(0xFFEC2127),
                    fontFamily: 'RobotoRegular',
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
