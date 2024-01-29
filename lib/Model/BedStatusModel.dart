import 'package:flutter/material.dart';

class BedStatusModel extends ChangeNotifier {
  BedStatus _selectedStatus = BedStatus(text: 'Ready', color: Colors.lightGreen);
  bool _showCarbolizeInfo = false;
  bool _showReadyInfo = false;
  bool _showOccupiedInfo = false;
  bool _showNotAvailableInfo = false;

  String carbolisetemporaryRemark = '';

  BedStatus get selectedStatus => _selectedStatus;
  bool get showCarbolizeInfo => _showCarbolizeInfo;
  bool get showReadyInfo => _showReadyInfo;
  bool get showOccupiedInfo => _showOccupiedInfo;
  bool get showNotAvailableInfo => _showNotAvailableInfo;




  DateTime _selectedAdmitDate = DateTime.now();
  DateTime get selectedAdmitDate => _selectedAdmitDate;

  DateTime _selectedDischargeDate = DateTime.now();
  DateTime get selectedDischargeDate => _selectedDischargeDate;

  DateTime _selectedCleanDate = DateTime.now();
  DateTime get selectedCleanDate => _selectedCleanDate;

  TimeOfDay _selectedCleanTime = TimeOfDay.now();
  TimeOfDay get selectedCleanTime => _selectedCleanTime;

  List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;



  Name _selectedName = Name(text: '');
  bool _showLennyInfo = false;
  bool _showCyannaInfo = false;
  bool _showNurulInfo = false;

  Name get selectedName => _selectedName;
  bool get showLennyInfo => _showLennyInfo;
  bool get showCyannaInfo => _showCyannaInfo;
  bool get showNurulInfo => _showNurulInfo;

  bool _requestConfirmed = false;
  bool get isRequestConfirmed => _requestConfirmed;

  bool _isDateAdmitSaved = false;
  bool _isDateDischargeSaved = false;

  bool  _isDateCleanSaved = false;
  bool _isTimeCleanSaved = false;


  int _carbolizationRequestCount = 0;

  int get carbolizationRequestCount => _carbolizationRequestCount;


  bool _isReadyStatusSaved = false;
  bool _isOccupiedStatusSaved = false;

  bool get isStatusSaved {
    // Add your logic to determine if any status is saved
    // For example, return true if any status is saved, otherwise return false
    return _isReadyStatusSaved || _isOccupiedStatusSaved;
  }

  bool get isReadyStatusSaved {
    // Add your logic to determine if the Ready status is saved
    return _isReadyStatusSaved;
  }

  bool get isOccupiedStatusSaved {
    // Add your logic to determine if the Occupied status is saved
    return _isOccupiedStatusSaved;
  }

  bool isLoading = false;

  void markReadyStatusAsSaved() {
    _isReadyStatusSaved = true;
    notifyListeners();
  }

  void markOccupiedStatusAsSaved() {
    _isOccupiedStatusSaved = true;
    notifyListeners();
  }
  // Function to increment the carbolization request count
  void incrementCarbolizationRequestCount() {
    _carbolizationRequestCount++;
    notifyListeners(); // Notify listeners to update the UI
  }

  void markDateAsSaved() {
    _isDateAdmitSaved = true;
    _isDateDischargeSaved = true;
  }

  void markDateAsSavedCarbolise() {
    _isDateCleanSaved = true;
    _isTimeCleanSaved = true;
  }


  DateTime getSelectedAdmitDate() {
    return _selectedAdmitDate;
  }

  DateTime getSelectedDischargeDate() {
    return _selectedDischargeDate;
  }

  DateTime getSelectedCleanDate() {
    return _selectedCleanDate;
  }

  TimeOfDay getSelectedCleanTime() {
    return _selectedCleanTime;
  }


  bool isDateAdmitSaved() {
    return _isDateAdmitSaved;

  }

  bool isDateDischargeSaved() {
    return _isDateDischargeSaved;

  }

  bool isDateCleanSaved() {
    return _isDateCleanSaved;

  }

  bool isTimeCleanSaved() {
    return _isTimeCleanSaved;

  }


  void updateSelectedName(String newName) {
    _selectedName = Name(text: newName);

    _showLennyInfo = newName == 'Lenny';
    _showCyannaInfo = newName == 'Cyanna';
    _showNurulInfo = newName == 'Nurul';

    notifyListeners();
  }


  void createOccupiedItem(Map<String, dynamic> newItem) {
    newItem['type'] = 'occupied'; // or use a constant for type
    _items.add(newItem);
    notifyListeners();
  }

  void updateOccupiedItem(int itemKey, Map<String, dynamic> updatedItem) {
    final index = _items.indexWhere((element) => element['key'] == itemKey && element['type'] == 'occupied');
    if (index != -1) {
      _items[index].addAll(updatedItem);
      notifyListeners();
    }
  }

  void createReadyItem(Map<String, dynamic> newItem) {
    newItem['type'] = 'ready'; // or use a constant for type
    _items.add(newItem);
    notifyListeners();
  }

  void updateReadyItem(int itemKey, Map<String, dynamic> updatedItem) {
    final index = _items.indexWhere((element) => element['key'] == itemKey && element['type'] == 'ready');
    if (index != -1) {
      _items[index].addAll(updatedItem);
      notifyListeners();
    }
  }

  void createCarboliseItem(Map<String, dynamic> newItem) {
    newItem['type'] = 'carbolise'; // or use a constant for type
    _items.add(newItem);
    notifyListeners();
  }

  void updateCarboliseItem(int itemKey, Map<String, dynamic> updatedItem) {
    final index = _items.indexWhere((element) => element['key'] == itemKey && element['type'] == 'carbolise');
    if (index != -1) {
      _items[index].addAll(updatedItem);
      notifyListeners();
    }
  }



  void deleteOccupiedItems() {
    _items.removeWhere((item) => item['type'] == 'occupied');
    notifyListeners();
  }

  void deleteReadyItems() {
    _items.removeWhere((item) => item['type'] == 'ready');
    notifyListeners();
  }



  void deleteCarboliseItems() {
    _items.removeWhere((item) => item['type'] == 'carbolise');
    notifyListeners();
  }


  /* void updateStatus(String newStatus, Color newColor) {
    _selectedStatus = BedStatus(text: newStatus, color: newColor);

    // Update the visibility based on the selected status
    _showCarbolizeInfo = newStatus == 'Carbolised';
    _showReadyInfo = newStatus == 'Ready';
    _showOccupiedInfo = newStatus == 'Occupied';
    _showNotAvailableInfo = newStatus == 'Not Available';

    notifyListeners();
  }*/

  void updateStatus(String newStatus , Color newColor) {

    // Only update the selected status, don't immediately notify listeners
    _selectedStatus = BedStatus(text: newStatus, color: newColor);
    if (newStatus != 'Carbolised') {
      _carbolizationRequestCount = 0;
    }
  }


  void confirmRequest() {
    _requestConfirmed = true;
    notifyListeners();
  }


  void updateSelectedCleanTime(TimeOfDay newTime) {
    _selectedCleanTime = newTime;
    _isTimeCleanSaved = false;
    notifyListeners();
  }

  void updateSelectedCleanDate(DateTime newDate) {
    _selectedCleanDate = newDate;
    _isDateCleanSaved = false;
    notifyListeners();
  }
  void updateSelectedAdmitDate(DateTime newDate) {
    _selectedAdmitDate = newDate;
    _isDateAdmitSaved = false; // Reset the saved flag when the date is updated
    notifyListeners();
  }
  void updateSelectedDischargeDate(DateTime newDate) {
    _selectedDischargeDate = newDate;
    _isDateDischargeSaved = false;
    notifyListeners();
  }

}

class BedStatus {
  final String text;
  final Color color;
  BedStatus({required this.text, required this.color});
}

class Name{
  final String text;
  Name({required this.text});
}
