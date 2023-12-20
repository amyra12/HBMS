import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:wsm_app/Notification_manager/notification_manager.dart';
import 'Model/BedStatusModel.dart';
import 'Model/BedStatusModelW1GB2.dart';
import 'Screens/WelcomeScreen.dart';
 // Import your BedStatusModel class

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationManager().initNotification();

  await Hive.initFlutter();
  await Hive.openBox('Ward_box');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BedStatusModel()),
        ChangeNotifierProvider(create: (context) => BedStatusModelW1GB2()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
