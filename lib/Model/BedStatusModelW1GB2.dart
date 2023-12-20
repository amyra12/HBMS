import 'package:flutter/material.dart';

class BedStatusModelW1GB2 extends ChangeNotifier {
  String selectedStatus = 'Ready'; // Default status
  Color statusColor = Colors.green; // Default color

  void updateStatus(String newStatus, Color newColor) {
    selectedStatus = newStatus;
    statusColor = newColor;
    notifyListeners();
  }
}
