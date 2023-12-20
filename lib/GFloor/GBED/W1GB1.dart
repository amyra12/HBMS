import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../Model/BedStatusModel.dart';
import '../../Notification_manager/notification_manager.dart';
import '../../Screens/ActivityScreen.dart';

import '../../widgets/navbar_root.dart';
import '../../widgets/sidemenu.dart';



class W1GB1 extends StatefulWidget{



  @override
  State<W1GB1> createState() => _W1GB1();
  }
String selectedStatus = 'Ready';



class _W1GB1 extends State<W1GB1>{
  final TextEditingController _remarkController = TextEditingController();
  bool showCarbolizeInfo = false;
  List<Bed> bedsToCarbolize = [];

  List<Map<String, dynamic>> _items = [];

  final _wardBox = Hive.box('ward_box');

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _refreshItems();
  }


  void _refreshItems(){
    final data = _wardBox.keys.map((key){
      final item = _wardBox.get(key);
      return{
        "key": key,
        "remark": item["remark"],



      };
    }).toList();

    setState(() {
      _items = data.reversed.toList();
      print(_items.length);
      //use reversed to sort from new to oldest
    });
  }

  //create new item
  Future<void> _createItem(Map<String, dynamic> newItem ) async {
    await _wardBox.add(newItem);
    _refreshItems();
  }

  Future<void> _updateItem(int itemKey, Map<String, dynamic> item ) async {
    await _wardBox.put(itemKey, item);
    _refreshItems();
  }



  void _showForm(BuildContext ctx, int? itemKey) async {
    if(itemKey != null){
      final existingItem =
      _items.firstWhere((element) => element['key'] == itemKey);
      _remarkController.text = existingItem['remark'];



    }

    showModalBottomSheet(
        context: ctx,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(ctx).viewInsets.bottom,
                top: 15,
                left: 15,
                right: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  controller: _remarkController,
                  decoration: const InputDecoration(hintText: 'Remark'),
                ),
                const SizedBox (height: 10),
                ElevatedButton(
                  onPressed: () async {
                    if (itemKey == null) {
                      _createItem({
                        "remark": _remarkController.text,
                      });
                    }
                    if(itemKey != null){
                      _updateItem(itemKey, {
                        'remark': _remarkController.text.trim(),
                      });
                    }

                    _remarkController.text = '';

                    Navigator.of(context).pop();
                  },
                  child: Text(itemKey == null ? 'Add' : 'Update'),
                )
              ],


            )
        )


    );

  }

  /*void _selectStatus(String status) {
    Color statusColor = _getStatusColor(status);
    Provider.of<BedStatusModel>(context, listen: false).updateStatusColor(statusColor);
  }*/





  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return Scaffold(

      //drawer: SideMenu(),
      appBar: AppBar(
        title: Text(" ",
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white, // Change this color to your desired color
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2F348F).withOpacity(0.8),
                Color(0xFFEC2127).withOpacity(0.8)], // Replace with your desired gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),

          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 700,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF2F348F).withOpacity(0.8),
                  Color(0xFFEC2127).withOpacity(0.8)],
              ),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Status:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 200,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonFormField<String>(
                      value: selectedStatus,
                      items: [
                        'Ready',
                        'Occupied',
                        'Carbolised', // Changed from 'Corbulised' to 'Carbolised'
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        if (value != null) {
                          setState(() {
                            selectedStatus = value;
                            // Set showCarbolizeInfo to true when 'Carbolised' is selected
                            showCarbolizeInfo = value == 'Carbolised';
                          });

                          // Access the BedStatusModel using Provider and update the status/color
                          BedStatusModel bedStatusModel = Provider.of<BedStatusModel>(context, listen: false);

                          Color statusColor;
                          switch (value) {
                            case 'Ready':
                              statusColor = Colors.green;
                              break;
                            case 'Occupied':
                              statusColor = Colors.blue;
                              break;
                            case 'Carbolised': // Changed from 'Corbulised' to 'Carbolised'
                              statusColor = Colors.orange;
                              // Don't navigate to the ActivityScreen here
                              NotificationManager().simpleNotificationShow();
                              break;
                            default:
                              statusColor = Colors.black;
                          }

                          bedStatusModel.updateStatus(value, statusColor);
                        }
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: _getTextColor(selectedStatus),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Patient Admit:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: Row(
                          children: [
                            Text(
                              '${selectedDate.toLocal()}'.split(' ')[0],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Patient Discharge:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: Row(
                          children: [
                            Text(
                              '${selectedDate.toLocal()}'.split(' ')[0],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 150,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Remark',
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Add more Text widgets or other widgets as needed
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () => _showForm(context, null),
                        icon: const Icon(Icons.edit, color: Colors.white),
                      ),
                      SizedBox(width: 1),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to the CarbolizeBedScreen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              //builder: (context) => ActivityScreen(beds: bedsToCarbolize),
                              builder: (context) => NavBarRoots(),
                            ),
                          );
                        },
                        child: Text('Save'),
                      ),
                    ],

                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the CarbolizeBedScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          //builder: (context) => ActivityScreen(beds: bedsToCarbolize),
                          builder: (context) => NavBarRoots(),
                        ),
                      );
                    },
                    child: Text('View Beds to Carbolize'),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Notes: Click icon to edit the date, time and remark.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),




                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
  Color _getTextColor(String status) {
    switch (status) {
      case 'Ready':
        return Colors.green;
      case 'Occupied':
        return Colors.blue;
      case 'Corbulised':
        return Colors.orange;
      default:
        return Colors.black;
    }
  }

  // Function to get status color
  Color _getStatusColor(String status) {
    switch (status) {
      case 'Ready':
        return Colors.green;
      case 'Occupied':
        return Colors.blue;
      case 'Corbulised':
        return Colors.orange;
      default:
        return Colors.black;
    }
  }

  }