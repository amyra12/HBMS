import 'package:flutter/material.dart';
import 'package:wsm_app/Notification_manager/notification_services.dart';

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
      body: Container(
        child: ElevatedButton(
          onPressed: () {
            NotificationService()
                .showNotification(title: 'Sample title', body: 'It works!');
          },
          child: Text('Show Notifications'), // Replace with your desired child widget
        ),
      )
    );
  }

}