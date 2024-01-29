import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

import '../biometric_helper.dart';
import '../widgets/navbar_root.dart';
import 'Home.dart';
import 'package:http/http.dart' as http;
class LoginScreen extends StatefulWidget{
  @override
    // TODO: implement build
    State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  bool passToggle = true;
  late final LocalAuthentication auth;
  bool _supportState = false;
  bool isLoadingLogin = false; // Added variable to track loading state
  bool isLoadingBiometric = false; // Added variable to track loading state

  bool showBiometric = false;
  bool isAuthenticated = false;

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

Future<void> loginRecord() async {
  if (username.text.isNotEmpty && password.text.isNotEmpty) {
    try {
      String uri = "http://192.168.1.115/hbms_api/login3.php";

      var res = await http.post(
        Uri.parse(uri),
        body: {
          "username": username.text,
          "password": password.text,
        },
      );

      var response = jsonDecode(res.body);

      if (response.containsKey("success") && response["success"] == "true") {
        print("Login Successful");
        // Navigate to the next screen after successful login
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NavBarRoots()),
        );
      } else {
        print("User not found. Admin must add the user.");
      }
    } catch (e) {
      print("Some issue: $e");
    }
  } else {
    print("Please fill in both fields");
  }
}



  @override
  void initState() {
    isBiometricsAvailable();
    super.initState();
  }

  isBiometricsAvailable() async {
    showBiometric = await BiometricHelper().hasEnrolledBiometrics();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: SafeArea(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(100),
                  child: Image.asset("assets/WMS.png"),
                ),
                SizedBox(height: 2),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    controller: username,
                    //obscureText: passToggle,
                    keyboardAppearance: Brightness.dark, // Make the text field visible when the keyboard is up
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      label: Text("Username"),
                      prefixIcon: Icon(Icons.person, color: Color(0xFF2F348F)),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    controller: password,
                    obscureText: passToggle,
                    keyboardAppearance: Brightness.dark, // Make the text field visible when the keyboard is up
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      label: Text("Password"),
                      prefixIcon: Icon(Icons.lock, color: Color(0xFF2F348F)),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        child: passToggle
                            ? Icon(CupertinoIcons.eye_slash_fill)
                            : Icon(CupertinoIcons.eye_fill),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),
                Material(
                  color: Color(0xFF2F348F),
                  borderRadius: BorderRadius.circular(20),
                  elevation: 5,
                  child: InkWell(
                    onTap: () async {
                      // Show loading indicator for login button
                      setState(() {
                        isLoadingLogin = true;
                      });

                      // Perform your login logic here
                      await Future.delayed(Duration(seconds: 2));

                      // Hide loading indicator for login button
                      setState(() {
                        isLoadingLogin = false;
                      });

                      loginRecord();
                    
                    /*Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NavBarRoots()),
                      );*/
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 83),
                      child: isLoadingLogin
                          ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                          : Text(
                        "Log In",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (showBiometric)
                      ElevatedButton(
                        onPressed: () async {
                          // Show loading indicator for biometric button
                          setState(() {
                            isLoadingBiometric = true;
                          });

                          isAuthenticated = await BiometricHelper().authenticate();

                          // Hide loading indicator for biometric button
                          setState(() {
                            isLoadingBiometric = false;
                          });

                          if (isAuthenticated) {
                            // Navigate to HomeScreen
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => NavBarRoots()),
                            );
                          }

                          setState(() {});
                        },
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: isLoadingBiometric
                              ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                              : Icon(
                            Icons.fingerprint,
                            color: Color(0xFF2F348F),
                            size: 50,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          primary: Colors.white, // Transparent background
                        ),
                      ),
                    SizedBox(height: 30),
                    // Text "Biometric"
                    Text(
                      "Biometric",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),


              ]
    )
    ),
    ),
    );

  }


  Future<void> _aunthenticate() async {
    try{
      bool authenticated = await auth.authenticate(
        localizedReason:
          'Subscribe or you will never find any stack overflow answer',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: false,
        ),
      );

      print("Authenticated: $authenticated");
    }on PlatformException catch (e){
      print(e);
    }
  }


  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics =
    await auth.getAvailableBiometrics();

    print("List of availableBiometrics : $availableBiometrics");

    if (!mounted) {
      return;
    }
  }
}