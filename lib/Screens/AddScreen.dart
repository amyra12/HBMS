import 'package:flutter/material.dart';

import '../widgets/sidemenu.dart';

class AddScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        title: Text("New Task",
          style: TextStyle(
              color: Colors.white
          ),

        ),
        backgroundColor: Color(0xFF01B0F1),

      ),
    );
  }

}