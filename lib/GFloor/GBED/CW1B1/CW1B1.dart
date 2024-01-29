import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:wsm_app/GFloor/GBED/W1GB1.dart';

import '../../../Model/BedStatusModel.dart';
import '../../../Notification_manager/notification_services.dart';
import '../../../widgets/navbar_root.dart';



class CW1B1 extends StatefulWidget {
  @override
  State<CW1B1> createState() => _CW1B1() ;

}

class _CW1B1 extends State <CW1B1>{
  String selectedName = 'Lenny';
  bool showLennyInfo = false;
  bool showCyannaInfo = false;
  bool showNurulInfo = false;
  bool dataSaved = false;

  DateTime selectedCleanDate = DateTime.now();
  TimeOfDay selectedCleanTime = TimeOfDay.now();

  String tempSelectedName = 'Lenny';
  List<Map<String, dynamic>> _items = [];

  final _wardBox = Hive.box('ward_box');


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
        "description": item["description"],
        "cremark": item["cremark"],

      };
    }).toList();

    setState(() {
      _items = data.reversed.toList();
      print(_items.length);
      //use reversed to sort from new to oldest
    });
  }


  Future<void> _selectCleanDate(BuildContext context, BedStatusModel bedStatusModel) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: bedStatusModel.selectedCleanDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );
    print("Clean Date picked: $picked");
    if (picked != null && picked != bedStatusModel.selectedCleanDate) {
      bedStatusModel.updateSelectedCleanDate(picked);
    }
  }



  Future<void> _selectCleanTime(BuildContext context, BedStatusModel bedStatusModel) async {
    // Show time picker
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: bedStatusModel.selectedCleanTime,
    );

    if (pickedTime != null) {
      // Update the selected time
      bedStatusModel.updateSelectedCleanTime(pickedTime);
    }
  }

  final TextEditingController _CremarkController = TextEditingController();
  String CtemporaryRemark = '';

  void _showCarboliseForm(BuildContext ctx, BedStatusModel bedStatusModel, [int? itemKey]) async {
    String CpreviousRemark = ''; // Store the previous remark before editing

    if (itemKey != null) {
      final existingItem =
      bedStatusModel.items.firstWhere((element) => element['key'] == itemKey);
      _CremarkController.text = existingItem['cremark'];
      CpreviousRemark = existingItem['cremark'];
    }

    showModalBottomSheet(
      context: ctx,
      elevation: 5,
      isScrollControlled: true,
      builder: (_) => Container(
        height: 500,
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
              controller: _CremarkController,
              decoration: const InputDecoration(hintText: 'Remark'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Save the remark temporarily
                CtemporaryRemark = _CremarkController.text.trim();
                Navigator.of(ctx).pop();
              },
              child: Text(itemKey == null ? 'Save' : 'Update'),
            )
          ],
        ),
      ),
    );

    // If the user cancels without saving, restore the previous remark
    if (CtemporaryRemark.isEmpty) {
      _CremarkController.text = CpreviousRemark;
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    BedStatusModel bedStatusModel = Provider.of<BedStatusModel>(context);
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(

      appBar: AppBar(
        title: Text(" ",
          style: TextStyle(
            color: Color(0xFF2F348F),
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
                Color(0xFFEC2127).withOpacity(0.8),], // Replace with your desired gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),

      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
        Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: 100,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,

            colors: [
              Color(0xFF2F348F).withOpacity(0.8),
              Color(0xFFEC2127).withOpacity(0.8),
            ],

          ),
          /*boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],*/
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(80),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              'Carbolise Request',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              'For Person-In-Charge only',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

          ],
        ),
      ),
              SizedBox(height: 5,),
              Expanded(
                child:  SingleChildScrollView(

                      child: Padding(
                          padding: const EdgeInsets.all(10.0),

                child: 
                  Container(
                padding: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                height: 700,
                decoration: BoxDecoration(
                 color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),

                ),

                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                  Text(
                  'Time Stamp',
                  style: TextStyle(
                    color: Color(0xFF2F348F),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        // Handle tap action, for example, show a dialog or navigate to another screen
                        _selectCleanDate(context, bedStatusModel);
                      },
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        color: Colors.white,
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
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${bedStatusModel.selectedCleanDate.toLocal()}'.split(' ')[0],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.calendar_month,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 5,),
                    GestureDetector(
                      onTap: () {
                        // Handle tap action, for example, show a dialog or navigate to another screen
                        _selectCleanTime(context, bedStatusModel);
                      },
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Time:',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${bedStatusModel.selectedCleanTime.format(context)}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.access_time_filled_sharp,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10,),
                    Text(
                      'Name of Person-In-Charge:',
                      style: TextStyle(
                        color: Color(0xFF2F348F),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: EdgeInsets.all(16),
                    child: Padding(
                      padding: const EdgeInsets.all(16),

                        child: Column(
                          children: [
                            DropdownButtonFormField<String>(
                              value: tempSelectedName, // Use the temporary variable
                              items: [
                                'Lenny',
                                'Nurul',
                                'Cyanna',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                if (value != null) {
                                  setState(() {
                                    tempSelectedName = value; // Update the temporary variable
                                  });
                                }
                              },
                          decoration: InputDecoration(
                            // Customize the underline appearance
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepPurple), // Set your preferred color
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepPurple), // Set your preferred color
                            ),
                          ),

                            ),
                            SizedBox(height: 10,),
                            Row(
                                children: [Text(
                                  'Person-In-Charge:',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            SizedBox(width: 10,),
                                  Consumer<BedStatusModel>(
                                    builder: (context, bedStatusModel, _) {
                                      String selectedNameText =
                                      bedStatusModel.selectedName?.text?.isNotEmpty ?? false
                                          ? bedStatusModel.selectedName.text
                                          : 'Have not decided';

                                      return Text(
                                        selectedNameText,
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      );
                                    },
                                  ),
                    ],
                            ),
                            SizedBox(height: 20),

                          ],
                        ),
                      ),

                  ),
                  ),
                ),
                    Text(
                      'Remark',
                      style: TextStyle(
                        color: Color(0xFF2F348F),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Consumer<BedStatusModel>(
                      builder: (context, bedStatusModel, child) {
                        return Container(
                          width: 400,
                          height: 100,
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
                                    child: GestureDetector(
                                      onTap: () => _showCarboliseForm(context, bedStatusModel),
                                      child: Text(
                                        CtemporaryRemark.isNotEmpty
                                            ? CtemporaryRemark
                                            : (bedStatusModel.items
                                            .where((item) => item['type'] == 'carbolise')
                                            .toList()
                                            .isNotEmpty
                                            ? bedStatusModel.items
                                            .where((item) => item['type'] == 'carbolise')
                                            .toList()
                                            .last['cremark']
                                            : 'Add a remark'),
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete, color: Colors.red),
                                    onPressed: () {
                                      // Check if there is a temporary remark, and if so, clear it
                                      if (CtemporaryRemark.isNotEmpty) {
                                        CtemporaryRemark = '';
                                      } else {
                                        // If there is no temporary remark, delete the occupied items
                                        bedStatusModel.deleteCarboliseItems();
                                      }
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

                    SizedBox(height: 10),

                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Show confirmation dialog
                            BedStatusModel bedStatusModel = Provider.of<BedStatusModel>(context, listen: false);

                            // Set the flag to indicate that the request is confirmed
                            bedStatusModel.confirmRequest();
                            bedStatusModel.markDateAsSavedCarbolise();
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Are you sure you want to save?", style: TextStyle(fontSize: 13),),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        // Close the dialog and proceed with saving
                                        Navigator.of(context).pop();

                                        BedStatusModel bedStatusModel = Provider.of<BedStatusModel>(context, listen: false);
                                          // Update the status in BedStatusModel only when "Save" is clicked
                                        if (CtemporaryRemark.isNotEmpty) {
                                          if (bedStatusModel.items.any((item) => item['cremark'] == CtemporaryRemark)) {
                                            // If the remark exists, update the existing item
                                            bedStatusModel.updateCarboliseItem(
                                              bedStatusModel.items.firstWhere((item) => item['cremark'] == CtemporaryRemark)['key'],
                                              {"cremark": CtemporaryRemark},
                                            );
                                          } else {
                                            // If the remark does not exist, create a new item
                                            bedStatusModel.createCarboliseItem({
                                              "cremark": CtemporaryRemark,
                                            });
                                          }
                                        }

                                        // Clear the temporary remark
                                        CtemporaryRemark = '';
                                        // Update the selectedName from the temporary variable
                                        bedStatusModel.updateSelectedName(tempSelectedName);

                                        // You can define your save logic here
                                        Future.delayed(Duration(seconds: 3), () {
                                          NotificationService().showNotification(
                                            title: 'Bed Status Updated!',
                                            body: 'Check this update',


                                          );
                                        });
                                        //Navigator.pop(context);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => W1GB1(selectedStatus: selectedStatus),
                                          ),
                                        );
                                      },
                                      child: Text("Yes"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // Close the dialog without saving
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("No"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Text('Save'),
                        ),
                        SizedBox(width: 5,),
                        ElevatedButton(
                          onPressed: () {
                            // Navigate to the CarbolizeBedScreen
                            Navigator.pop(context);

                            // If the temporary remark is empty, restore the previous remark
                            if (CtemporaryRemark.isEmpty) {
                              _showCarboliseForm(context, bedStatusModel);
                            } else {
                              // Clear the temporary remark
                              CtemporaryRemark = '';
                            }
                          },
                          child: Text('Cancel'),
                        ),
                      ],
                    ),
                     ],
              ),
              ),
            
    )
    ),
    ),
  
    ]
      )
    )
    
    ]
    )
    )
    ));
  }


  Future<bool> _onWillPop() async {
    if (!dataSaved) {
      bool confirmLeave = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Confirmation leave'),
          content: Text('Finish editing?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Allow back navigation without saving
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Stay on the current page
              },
              child: Text('No'),
            ),
          ],
        ),
      );

      return confirmLeave ?? false; // If the dialog is dismissed, default to false (don't allow back navigation)
    }

    return true; // Allow back navigation if data is saved
  }
}








