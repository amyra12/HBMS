import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

import '../biometric_helper.dart';
import '../widgets/navbar_root.dart';
import 'Home.dart';

class LoginScreen extends StatefulWidget{
  @override
    // TODO: implement build
    State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  bool passToggle = true;
  late final LocalAuthentication auth;
  bool _supportState = false;

  bool showBiometric = false;
  bool isAuthenticated = false;

  /*@override
  void initState() {
    super.initState();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then(
            (bool isSupported) =>
            setState(() {
              _supportState = isSupported;
            })
    );
  }*/

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


                Padding(padding: EdgeInsets.all(20),
                  child: Image.asset("assets/WMS.png"),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: TextField(
                    obscureText: passToggle ? true : false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Username"),
                        prefixIcon: Icon(Icons.person)
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Padding(
                  padding: EdgeInsets.all(12),
                  child: TextField(
                    obscureText: passToggle ? true : false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Password"),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: InkWell(
                          onTap: () {
                            if (passToggle == true) {
                              passToggle = false;
                            } else {
                              passToggle = true;
                            }
                            setState(() {});
                          },
                          child: passToggle
                              ? Icon(CupertinoIcons.eye_slash_fill)
                              : Icon(CupertinoIcons.eye_fill),
                        )
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Material(
                  color: Color(0xFF2F348F),
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => NavBarRoots()
                          ));
                    },
                    child: Padding(padding: EdgeInsets.symmetric(
                        vertical: 15, horizontal: 40),
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

                if (showBiometric)
                  ElevatedButton(
                    child: const Text(
                      'Biometric Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () async {
                      isAuthenticated = await BiometricHelper().authenticate();

                      if (isAuthenticated) {
                        // Navigate to HomeScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NavBarRoots()),
                        );
                      }

                      setState(() {});
                    },
                  ),

              ],
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