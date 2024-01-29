import 'package:flutter/material.dart';

class BedStatusModelW1GB2 extends ChangeNotifier {
  BedStatus _selectedStatus = BedStatus(text: 'Ready', color: Colors.lightGreen);
  bool _showCarbolizeInfo = false;
  bool _showReadyInfo = false;
  bool _showOccupiedInfo = false;

  BedStatus get selectedStatus => _selectedStatus;
  bool get showCarbolizeInfo => _showCarbolizeInfo;
  bool get showReadyInfo => _showReadyInfo;
  bool get showOccupiedInfo => _showOccupiedInfo;

  DateTime _selectedAdmitDate = DateTime.now();
  DateTime get selectedAdmitDate => _selectedAdmitDate;

  DateTime _selectedDischargeDate = DateTime.now();
  DateTime get selectedDischargeDate => _selectedDischargeDate;

  List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  bool _requestConfirmed = false;
  bool get isRequestConfirmed => _requestConfirmed;

  void createItem(Map<String, dynamic> newItem) {
    _items.add(newItem);
    notifyListeners();
  }

  void updateItem(int itemKey, Map<String, dynamic> updatedItem) {
    final index = _items.indexWhere((element) => element['key'] == itemKey);
    if (index != -1) {
      _items[index].addAll(updatedItem);
      notifyListeners();
    }
  }

  void deleteAllItems() {
    _items.clear();
    notifyListeners();
  }

  /*void updateStatus(String newStatus, Color newColor) {
    _selectedStatus = BedStatus(text: newStatus, color: newColor);

    // Update the visibility based on the selected status
    _showCarbolizeInfo = newStatus == 'Carbolised';
    _showReadyInfo = newStatus == 'Ready';
    _showOccupiedInfo = newStatus == 'Occupied';

    notifyListeners();

  }*/


  void updateStatus(String newStatus , Color newColor) {

    // Only update the selected status, don't immediately notify listeners
    _selectedStatus = BedStatus(text: newStatus, color: newColor);
  }


  void confirmRequest() {
    _requestConfirmed = true;
    notifyListeners();
  }

  void updateSelectedAdmitDate(DateTime newDate) {
    _selectedAdmitDate = newDate;
    notifyListeners();
  }

  void updateSelectedDischargeDate(DateTime newDate) {
    _selectedDischargeDate = newDate;
    notifyListeners();
  }

}

class BedStatus {
  final String text;
  final Color color;
  BedStatus({required this.text, required this.color});
}
