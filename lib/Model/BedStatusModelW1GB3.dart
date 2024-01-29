import 'package:flutter/material.dart';



class BedStatusModelW1GB3 extends ChangeNotifier {
  String _selectedStatus = 'Ready';
  bool _requestConfirmed = false;

  String get selectedStatus => _selectedStatus;
  bool get isRequestConfirmed => _requestConfirmed;

  void updateStatus(String status) {
    // Only update the selected status, don't immediately notify listeners
    _selectedStatus = status;
  }

  void confirmRequest() {
    _requestConfirmed = true;
    notifyListeners();
  }
}