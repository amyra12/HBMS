import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'Model/BedStatusModel.dart';
import 'Model/BedStatusModelW1GB1.dart';
import 'Model/BedStatusModelW1GB2.dart';
import 'Model/BedStatusModelW1GB3.dart';
import 'Notification_manager/notification_services.dart';
import 'Screens/WelcomeScreen.dart';
 // Import your BedStatusModel class

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('ward_box');
  NotificationService().initNotification();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BedStatusModel()),
        ChangeNotifierProvider(create: (context) => BedStatusModelW1GB1()),
        ChangeNotifierProvider(create: (context) => BedStatusModelW1GB2()),
        ChangeNotifierProvider(create: (context) => BedStatusModelW1GB3()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hospital Bed Management System',
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(title: 'Hospital Bed Management System'),
    );


  }
}
