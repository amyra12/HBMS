import 'package:flutter/material.dart';

class BedStatusModel extends ChangeNotifier {
  BedStatus _selectedStatus = BedStatus(text: 'Ready', color: Colors.green);
  bool _showCarbolizeInfo = false;

  BedStatus get selectedStatus => _selectedStatus;
  bool get showCarbolizeInfo => _showCarbolizeInfo;

  void updateStatus(String newStatus, Color newColor) {
    _selectedStatus = BedStatus(text: newStatus, color: newColor);

    // Update the visibility based on the selected status
    _showCarbolizeInfo = newStatus == 'Carbolised';

    notifyListeners();
  }
}

class BedStatus {
  final String text;
  final Color color;

  BedStatus({required this.text, required this.color});
}
