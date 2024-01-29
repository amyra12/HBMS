import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../Bed.dart';
import '../../Model/BedStatusModel.dart';
import '../../Model/BedStatusModelW1GB2.dart';
import '../../widgets/sidemenu.dart';



class W1GB2 extends StatefulWidget{

  @override
  State<W1GB2> createState() => _W1GB2();
}
String selectedStatus = 'Ready';


class _W1GB2 extends State<W1GB2>{
  final TextEditingController _remarkController = TextEditingController();
  bool showCarbolizeInfo = false;

  List<Map<String, dynamic>> _items = [];

  final _wardBox = Hive.box('ward_box');

  DateTime selectedAdmitDate = DateTime.now();
  TimeOfDay selectedAdmitTime = TimeOfDay.now();

  DateTime selectedDischargeDate = DateTime.now();
  TimeOfDay selectedDischargeTime = TimeOfDay.now();

 // BedStatusModelW1GB2 get bedStatusModelW1GB2 => null;


  Future<void> _selectAdmitDate(BuildContext context, BedStatusModelW1GB2 bedStatusModelW1GB2) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: bedStatusModelW1GB2.selectedAdmitDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );
    print("Admit Date picked: $picked");
    if (picked != null && picked != bedStatusModelW1GB2.selectedAdmitDate) {
      bedStatusModelW1GB2.updateSelectedAdmitDate(picked);
    }
  }

  Future<void> _selectDischargeDate(BuildContext context, BedStatusModelW1GB2 bedStatusModelW1GB2) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: bedStatusModelW1GB2.selectedDischargeDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );
    print("Discharge Date picked: $picked");
    if (picked != null && picked != bedStatusModelW1GB2.selectedDischargeDate) {
      bedStatusModelW1GB2.updateSelectedDischargeDate(picked);
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



  void _showForm(BuildContext ctx, BedStatusModelW1GB2 bedStatusModelW1GB2, [int? itemKey]) async {
    if (itemKey != null) {
      final existingItem =
      bedStatusModelW1GB2.items.firstWhere((element) => element['key'] == itemKey);
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
          right: 15,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _remarkController,
              decoration: const InputDecoration(hintText: 'Remark'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                if (itemKey == null) {
                  bedStatusModelW1GB2.createItem({
                    "remark": _remarkController.text,
                  });
                }
                if (itemKey != null) {
                  bedStatusModelW1GB2.updateItem(itemKey, {
                    'remark': _remarkController.text.trim(),
                  });
                }

                _remarkController.text = '';
                Navigator.of(ctx).pop();
              },
              child: Text(itemKey == null ? 'Save' : 'Update'),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    BedStatusModelW1GB2 bedStatusModelW1GB2 = BedStatusModelW1GB2();

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
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(context, Provider.of<BedStatusModelW1GB2>(context, listen: false)),
        child: Icon(Icons.edit),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(15),

          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 800,
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
                  Row(
                    children: [Text(
                      'Bed:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                      SizedBox(width: 10),
                      Text(
                        'Bed 2',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 25),
                      //Image.asset("assets/bandage.png"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Status:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Consumer<BedStatusModelW1GB2>(
                    builder: (context, bedStatusModelW1GB2, child) {
                      return Container(
                        width: 200,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonFormField<String>(
                          value: bedStatusModelW1GB2.selectedStatus.text,
                          items: [
                            'Ready',
                            'Occupied',
                            'Carbolised',
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
                                showCarbolizeInfo = value == 'Carbolised';
                              });

                              BedStatusModelW1GB2 bedStatusModelW1GB2 =
                              Provider.of<BedStatusModelW1GB2>(context, listen: false);

                              Color statusColor;
                              switch (value) {
                                case 'Ready':
                                  statusColor = Colors.lightGreen;
                                  break;
                                case 'Occupied':
                                  statusColor = Colors.lightBlueAccent;
                                  break;
                                case 'Carbolised':
                                  statusColor = Colors.orange;
                                  break;
                                default:
                                  statusColor = Colors.black;
                              }

                              bedStatusModelW1GB2.updateStatus(value, statusColor);
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
                      );
                    },
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
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    color: Colors.white, // Set the background color to white
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Date:',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Consumer<BedStatusModelW1GB2>(
                            builder: (context, bedStatusModelW1GB2, child) {
                              return GestureDetector(
                                onTap: () => _selectAdmitDate(context, bedStatusModelW1GB2),
                                child: Row(
                                  children: [
                                    Text(
                                      '${bedStatusModelW1GB2.selectedAdmitDate.toLocal()}'.split(' ')[0],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.calendar_month,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
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
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    color: Colors.white, // Set the background color to white
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Date:',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Consumer<BedStatusModelW1GB2>(
                            builder: (context, bedStatusModelW1GB2, child) {
                              return GestureDetector(
                                onTap: () => _selectDischargeDate(context, bedStatusModelW1GB2),
                                child: Row(
                                  children: [
                                    Text(
                                      '${bedStatusModelW1GB2.selectedDischargeDate.toLocal()}'.split(' ')[0],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.calendar_month,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),


                  SizedBox(height: 20),
                  Consumer<BedStatusModelW1GB2>(
                    builder: (context, bedStatusModelW1GB2, child) {
                      return Container(
                        width: double.infinity,
                        height: 150,
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    bedStatusModelW1GB2.items.isNotEmpty ? bedStatusModelW1GB2.items.last['remark'] : 'Add a remark',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                ),
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red,),
                                  onPressed: () {
                                    // Add logic here to delete the remark
                                    bedStatusModelW1GB2.deleteAllItems();
                                  },
                                ),
                              ],
                            ),
                            // Add more Text widgets or other widgets as needed
                          ],
                        ),
                      );
                    },
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

                  ElevatedButton(
                    onPressed: () {
                      // Access the BedStatusModel using Provider and update the status/color
                      BedStatusModelW1GB2 bedStatusModelW1GB2 = Provider.of<BedStatusModelW1GB2>(context, listen: false);
                      //String selectedStatus = bedStatusModelW1GB2.selectedStatus;

                      // Set the flag to indicate that the request is confirmed
                      bedStatusModelW1GB2.confirmRequest();

                      // Show a dialog with the selected status
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Status Confirmed'),
                            content: Text('Selected Status: $selectedStatus'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  // Close the dialog
                                  Navigator.pop(context);

                                  // Update the status in BedStatusModel only when "Save" is clicked
                                  bedStatusModelW1GB2.notifyListeners();

                                  // Navigate back to the previous screen
                                  Navigator.pop(context);
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('Yes'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Close the confirmation screen without saving
                      Navigator.pop(context);
                    },
                    child: Text('No'),
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
        return Colors.lightBlueAccent;
      case 'Corbulised':
        return Colors.orange;
      default:
        return Colors.black;
    }
  }



}