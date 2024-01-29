import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:wsm_app/GFloor/GBED/CW1B1/BH1B1.dart';
import 'package:wsm_app/GFloor/GBED/CW1B1/CW1B1.dart';

import '../../Model/BedStatusModel.dart';

import '../../Notification_manager/notification_services.dart';
import '../../Screens/ActivityScreen.dart';


import '../../widgets/navbar_root.dart';
import '../WARD/W1G.dart';



class W1GB1 extends StatefulWidget{

  final String selectedStatus;
  W1GB1({required this.selectedStatus});

  @override
  State<W1GB1> createState() => _W1GB1();
  }
String selectedStatus = 'Ready';



class _W1GB1 extends State<W1GB1>{

  bool dataSaved = false;
  bool showCarbolizeInfo = false;
  bool showReadyInfo = false;
  bool showOccupiedInfo = false;
  bool showNotAvailableInfo = false;
  List<Bed> bedsToCarbolize = [];
  String userRole = 'admin';

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

      };
    }).toList();

    setState(() {
      _items = data.reversed.toList();
      print(_items.length);
      //use reversed to sort from new to oldest
    });
  }






/*void _selectStatus(String status) {
    Color statusColor = _getStatusColor(status);
    Provider.of<BedStatusModel>(context, listen: false).updateStatusColor(statusColor);
  }*/





  @override
  Widget build(BuildContext context) {
    Widget formLayout;

    switch (selectedStatus) {
      case 'Occupied':
        formLayout = OccupiedFormLayout();
        break;
      case 'Ready':
        formLayout = ReadyFormLayout();
        break;
      default:
        formLayout = NotFormLayout();
        break;
    }

    // TODO: implement build
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(

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
        actions: [
          IconButton(
            icon: Icon(Icons.history_rounded, color: Colors.white),
            onPressed: () {
              if (userRole == 'admin') {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CW1B1()));
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Access Denied'),
                      content: Text('Only admins can access this feature.'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.work_history_rounded, color: Colors.white), // Use your desired icon
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BH1B1(),
                  ));
            },
          ),
        ],
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () => _showOccupiedForm(context, Provider.of<BedStatusModel>(context, listen: false)),
        child: Icon(Icons.edit),
      ),*/
      body: SingleChildScrollView(
        child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                child: Container(

                width: MediaQuery.of(context).size.width,
                height: 180,
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
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(width: 5),
                    Text(
                      'Bed 1',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 25),
                    //Image.asset("assets/bandage.png"),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Status:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                        /*child: DropdownButtonFormField<String>(
                          value: selectedStatus,
                          items: [
                            'Ready',
                            'Occupied',
                            'Not Available',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            if (value != null) {
                              setState(() {
                                selectedStatus = value;
                                //showReadyInfo = value == 'Ready';
                                //showOccupiedInfo = value == 'Occupied';
                                showNotAvailableInfo = value == 'Not Available';
                              });

                              // Access the BedStatusModel using Provider and update the status/color
                              BedStatusModel bedStatusModel =
                              Provider.of<BedStatusModel>(context, listen: false);

                              Color statusColor;
                              switch (value) {
                              //case 'Ready':
                              //statusColor = Colors.lightGreen;
                              // break;
                              //case 'Occupied':
                              //statusColor = Colors.lightBlueAccent;
                              // break;
                                case 'Not Available':
                                  statusColor = Colors.red;
                                  break;

                                default:
                                  statusColor = Colors.white;
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
                        ),*/
                  SizedBox(height: 5),
                        Consumer<BedStatusModel>(
                          builder: (context, bedStatusModel, child) {
                            return Container(
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
                                  'Not Available',
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
                                      showNotAvailableInfo = value == 'Not Available';
                                    });

                                    //BedStatusModel bedStatusModel = Provider.of<BedStatusModel>(context, listen: false);

                                    Color statusColor;
                                    switch (value) {
                                      case 'Ready':
                                        statusColor = Colors.lightGreen;
                                        break;
                                      case 'Occupied':
                                        statusColor = Colors.lightBlueAccent;
                                        break;
                                      case 'Not Available':
                                        statusColor = Colors.red;
                                        break;
                                      default:
                                        statusColor = Colors.black;
                                    }

                                    //bedStatusModel.updateStatus(value, statusColor);
                                  }
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(
                                  color: _getTextColor(selectedStatus),
                                  fontSize: 16,
                                ),
                              )
                            );

                          },
                        ),
                                          ],
                        ),
                          ),
                        ),

                        ),
              SizedBox(height: 2,),

              formLayout,

              SizedBox(height: 2,),
              Container(
                  padding: EdgeInsets.all(15),
                  child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,

                    child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                  children: [



                    ]
                    ),
                  )
                  )
              )
            ]
        )
      ),

    )
    );
  }
  Color _getTextColor(String status) {
    switch (status) {
      case 'Ready':
        return Colors.lightGreen;
      case 'Occupied':
        return Colors.lightBlueAccent;
      case 'Not Available':
        return Colors.red;
      case 'Corbulised':
        return Colors.orange;
      default:
        return Colors.black;
    }
  }



  Future<bool> _onWillPop() async {
    if (!dataSaved) {
      return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Confirmation leave'),
          content: Text('Finish edited?'),
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
      ) ?? false; // If the dialog is dismissed, default to false (don't allow back navigation)
    }

    return true; // Allow back navigation if data is saved
  }
}




class OccupiedFormLayout extends StatefulWidget {

  @override
  _OccupiedFormLayoutState createState() => _OccupiedFormLayoutState();
}
final TextEditingController _remarkController = TextEditingController();
String temporaryRemark = '';

void _showOccupiedForm(BuildContext ctx, BedStatusModel bedStatusModel, [int? itemKey]) async {
  String previousRemark = ''; // Store the previous remark before editing

  if (itemKey != null) {
    final existingItem =
    bedStatusModel.items.firstWhere((element) => element['key'] == itemKey);
    _remarkController.text = existingItem['remark'];
    previousRemark = existingItem['remark'];
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
            controller: _remarkController,
            decoration: const InputDecoration(hintText: 'Remark'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Save the remark temporarily
              temporaryRemark = _remarkController.text.trim();
              Navigator.of(ctx).pop();
            },
            child: Text(itemKey == null ? 'Save' : 'Update'),
          )
        ],
      ),
    ),
  );

  // If the user cancels without saving, restore the previous remark
  if (temporaryRemark.isEmpty) {
    _remarkController.text = previousRemark;
  }
}
class _OccupiedFormLayoutState extends State<OccupiedFormLayout> {
  bool isRequestConfirmed = false;
  bool isStatusChanged = false;
  bool showCarbolizeInfo = false;
  bool showReadyInfo = false;
  bool showOccupiedInfo = false;
  DateTime selectedAdmitDate = DateTime.now();
  TimeOfDay selectedAdmitTime = TimeOfDay.now();

  DateTime selectedDischargeDate = DateTime.now();
  TimeOfDay selectedDischargeTime = TimeOfDay.now();
  bool isRequestButtonEnabled = true;

  Future<void> _selectAdmitDate(BuildContext context, BedStatusModel bedStatusModel) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: bedStatusModel.selectedAdmitDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );
    print("Admit Date picked: $picked");
    if (picked != null && picked != bedStatusModel.selectedAdmitDate) {
      bedStatusModel.updateSelectedAdmitDate(picked);
    }
  }

  Future<void> _selectDischargeDate(BuildContext context, BedStatusModel bedStatusModel) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: bedStatusModel.selectedDischargeDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != bedStatusModel.selectedDischargeDate) {
      bedStatusModel.updateSelectedDischargeDate(picked);
    }
  }


  @override
  Widget build(BuildContext context) {

    BedStatusModel bedStatusModel = Provider.of<BedStatusModel>(context);
    return Container(

        padding: EdgeInsets.all(15),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height:700,
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
                  'Patient Admit:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    // Handle tap action, for example, show a dialog or navigate to another screen
                    _selectAdmitDate(context, bedStatusModel);
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
                              color: Colors.black, // You can adjust the color as needed
                              fontSize: 15,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '${bedStatusModel.selectedAdmitDate.toLocal()}'.split(' ')[0],
                                style: TextStyle(
                                  color: Colors.black, // You can adjust the color as needed
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.calendar_month,
                                color: Colors.black, // You can adjust the color as needed
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 5),
                Text(
                  'Patient Discharge:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    // Handle tap action, for example, show a dialog or navigate to another screen
                    _selectDischargeDate(context, bedStatusModel);
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
                                '${bedStatusModel.selectedDischargeDate.toLocal()}'.split(' ')[0],
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

                SizedBox(height: 20),
                Consumer<BedStatusModel>(
                  builder: (context, bedStatusModel, child) {
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
                                child: GestureDetector(
                                  onTap: () => _showOccupiedForm(context, bedStatusModel),
                                  child: Text(
                                    temporaryRemark.isNotEmpty
                                        ? temporaryRemark
                                        : (bedStatusModel.items
                                        .where((item) => item['type'] == 'occupied')
                                        .toList()
                                        .isNotEmpty
                                        ? bedStatusModel.items
                                        .where((item) => item['type'] == 'occupied')
                                        .toList()
                                        .last['remark']
                                        : 'Add remark'),
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
                                  if (temporaryRemark.isNotEmpty) {
                                    temporaryRemark = '';
                                  } else {
                                    // If there is no temporary remark, delete the occupied items
                                    bedStatusModel.deleteOccupiedItems();
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
                //SizedBox(height: 10,),
           /* ElevatedButton(
              onPressed: () => _showOccupiedForm(context, Provider.of<BedStatusModel>(context, listen: false)),
              child: Text('Edit Remark'),
            ),*/
                SizedBox(height: 20),
                Text(
                  'Notes: Click icon to edit the date, time and remark. Add and edit remark using floating button',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                    onPressed: isRequestConfirmed || bedStatusModel.selectedStatus.text == 'Carbolised' || !isRequestButtonEnabled
                    ? null
                        : () async {
                    if (isRequestButtonEnabled) {
                    // Show a confirmation dialog
                    bool confirmRequest = await showDialog(
                    context: context,
                      builder: (BuildContext context) {



                            return AlertDialog(
                              title: Text('Confirm Request'),
                              content: Text('Are you sure you want to request carbolization?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    // Dismiss the dialog and indicate that the request is not confirmed
                                    Navigator.of(context).pop(false);
                                  },
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // Dismiss the dialog and indicate that the request is confirmed
                                    Navigator.of(context).pop(true);
                                  },
                                  child: Text('Confirm'),
                                ),
                              ],
                            );
                          },
                        );

                        if (confirmRequest == true) {
                          BedStatusModel bedStatusModel = Provider.of<BedStatusModel>(context, listen: false);

                          bedStatusModel.updateStatus('Carbolised', Colors.orange);
                          bedStatusModel.incrementCarbolizationRequestCount();

                          setState(() {
                            isRequestConfirmed = true;
                            isRequestButtonEnabled = false; // Disable the button after the request is confirmed
                          });
                          // Navigate to the W1B screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => W1B()),
                                );
                              }
                          }
                    },
                      child: Text('Request for Carbolise'),
                    ),

                    SizedBox(height: 20), // Add some spacing
                   /*Text(
                      selectedStatus == 'Carbolised'
                          ? 'Carbolization has been requested.'
                          : 'No carbolization request.',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),*/
                  ],
                ),
                SizedBox(height: 15,),
                Center(
                  child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Access the BedStatusModel using Provider and update the status/color
                        BedStatusModel bedStatusModel = Provider.of<BedStatusModel>(context, listen: false);

                        bedStatusModel.updateStatus('Occupied', Colors.blue);
                        // Set the flag to indicate that the request is confirmed
                        bedStatusModel.confirmRequest();
                        bedStatusModel.markDateAsSaved();

                        bedStatusModel.markOccupiedStatusAsSaved();
                        // Enable the "Request Carbolise" button after clicking "Save"
                        setState(() {
                          isRequestButtonEnabled = true;
                        });
                        // Show a dialog with the selected status and the remark
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8, // Set the width to 80% of the screen width
                                height: 300, // Set the height to 50% of the screen height
                                child: AlertDialog(
                                  title: Text('Status Confirmed'),
                                  content: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Selected Status: $selectedStatus'),
                                      Row(
                                        children: [
                                          Text(
                                            'Date Admit: ',
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(width: 2),
                                          // Check if the bed status is "Occupied" before displaying the admit date
                                          //if (Provider.of<BedStatusModel>(context).selectedStatus.text == 'Occupied')
                                          Text(
                                            bedStatusModel.isDateAdmitSaved()
                                                ? bedStatusModel.getSelectedAdmitDate().toLocal().toString().split(' ')[0]
                                                : 'Select a date',
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Date Discharge: ',
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(width: 2),
                                          // Check if the bed status is "Occupied" before displaying the discharge date

                                          Text(
                                            bedStatusModel.isDateDischargeSaved()
                                                ? bedStatusModel.getSelectedDischargeDate().toLocal().toString().split(' ')[0]
                                                : 'Select a date',
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      //Text('Remark: ${temporaryRemark.isNotEmpty ? temporaryRemark : 'No remark'}'),
                                      // Add other content as needed
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        // Close the dialog
                                        Navigator.pop(context);

                                        // Update the status in BedStatusModel only when "Save" is clicked
                                        if (temporaryRemark.isNotEmpty) {
                                          if (bedStatusModel.items.any((item) => item['remark'] == temporaryRemark)) {
                                            // If the remark exists, update the existing item
                                            bedStatusModel.updateOccupiedItem(
                                              bedStatusModel.items.firstWhere((item) => item['remark'] == temporaryRemark)['key'],
                                              {"remark": temporaryRemark},
                                            );
                                          } else {
                                            // If the remark does not exist, create a new item
                                            bedStatusModel.createOccupiedItem({
                                              "remark": temporaryRemark,
                                            });
                                          }
                                        }

                                        // Clear the temporary remark
                                        temporaryRemark = '';

                                        // Navigate back to the previous screen
                                        //Navigator.pop(context);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => W1B(),
                                          ),
                                        );
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );

                      },
                      child: Text('Save'),
                    ),
                      SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Close the confirmation screen without saving
                        Navigator.pop(context);
                        if (temporaryRemark.isNotEmpty) {
                          temporaryRemark = '';
                        } else {
                          // If the temporary remark is empty, do not perform additional actions
                          return;
                        }
                        // If the temporary remark is empty, restore the previous remark

                      },
                      child: Text('Cancel'),
                    ),
                  ],
                ),
                ),
              ],
            ),
          ),
        ),

    );
  }
}


class ReadyFormLayout extends StatefulWidget {
  @override
  _ReadyFormLayoutState createState() => _ReadyFormLayoutState();
}

final TextEditingController _descriptionController = TextEditingController();

String temporaryDescription = '';

void _showReadyForm(BuildContext ctx, BedStatusModel bedStatusModel, [int? itemKey]) async {
  String previousDescription = ''; // Store the previous remark before editing

  if (itemKey != null) {
    final existingItem =
    bedStatusModel.items.firstWhere((element) => element['key'] == itemKey);
    _descriptionController.text = existingItem['description'];
    previousDescription = existingItem['description'];
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
            controller: _descriptionController,
            decoration: const InputDecoration(hintText: 'Description'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Save the remark temporarily
              temporaryDescription = _descriptionController.text.trim();
              Navigator.of(ctx).pop();
            },
            child: Text(itemKey == null ? 'Save' : 'Update'),
          )
        ],
      ),
    ),
  );

  // If the user cancels without saving, restore the previous remark
  if (temporaryDescription.isEmpty) {
    _descriptionController.text = previousDescription;
  }
}


class _ReadyFormLayoutState extends State<ReadyFormLayout> {
  bool showReadyInfo = false;
  bool isRequestConfirmed = false;
  bool isRequestButtonEnabled = true;
  @override
  Widget build(BuildContext context) {

    BedStatusModel bedStatusModel = Provider.of<BedStatusModel>(context);
    return Container(
        padding: EdgeInsets.all(15),
            child: Container(

            width: MediaQuery.of(context).size.width,
            height: 380,
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

              SizedBox(height: 5,),
              Consumer<BedStatusModel>(
                builder: (context, bedStatusModel, child) {
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
                              child: GestureDetector(
                                onTap: () => _showReadyForm(context, bedStatusModel),
                                child: Text(
                                  temporaryDescription.isNotEmpty
                                      ? temporaryDescription
                                      : (bedStatusModel.items
                                      .where((item) => item['type'] == 'ready')
                                      .toList()
                                      .isNotEmpty
                                      ? bedStatusModel.items
                                      .where((item) => item['type'] == 'ready')
                                      .toList()
                                      .last['description']
                                      : 'Add a description'),
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
                                if (temporaryDescription.isNotEmpty) {
                                  temporaryDescription = '';
                                } else {
                                  // If there is no temporary remark, delete the occupied items
                                  bedStatusModel.deleteReadyItems();
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
                //SizedBox(height: 10,),
                /*ElevatedButton(
                  onPressed: () => _showReadyForm(context, Provider.of<BedStatusModel>(context, listen: false)),
                  child: Text('Edit Remark'),
                ),*/
              SizedBox(height: 20),
              Text(
                'Notes: Click icon to edit edit remark using floating button',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
                SizedBox(height: 15),
                Center(
                    child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        BedStatusModel bedStatusModel = Provider.of<BedStatusModel>(context, listen: false);
                        bedStatusModel.updateStatus('Ready', Colors.lightGreen);
                        bedStatusModel.confirmRequest();
                        bedStatusModel.markDateAsSaved();
                        bedStatusModel.markReadyStatusAsSaved();

                        // Enable the "Request Carbolise" button after clicking "Save"
                        setState(() {
                          isRequestButtonEnabled = true;
                        });

                        // Show a dialog with the selected status and the remark
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8, // Set the width to 80% of the screen width
                                height: 300, // Set the height to 50% of the screen height
                                child: AlertDialog(
                                  title: Text('Status Confirmed'),
                                  content: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Selected Status: $selectedStatus'),
                                      // Add other content as needed
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        // Close the dialog
                                        //Navigator.pop(context);

                                        // Update the status in BedStatusModel only when "Save" is clicked
                                        if (temporaryDescription.isNotEmpty) {
                                          if (bedStatusModel.items.any((item) => item['description'] == temporaryDescription)) {
                                            // If the remark exists, update the existing item
                                            bedStatusModel.updateOccupiedItem(
                                              bedStatusModel.items.firstWhere((item) => item['description'] == temporaryDescription)['key'],
                                              {"description": temporaryDescription},
                                            );
                                          } else {
                                            // If the remark does not exist, create a new item
                                            bedStatusModel.createReadyItem({
                                              "description": temporaryDescription,
                                            });
                                          }
                                        }

                                        // Clear the temporary remark
                                        temporaryDescription = '';

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => W1B(),
                                          ),
                                        );
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );

                      },
                      child: Text('Save'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Close the confirmation screen without saving
                        Navigator.pop(context);

                        // If the temporary remark is not empty, clear it
                        if (temporaryDescription.isNotEmpty) {
                          temporaryDescription = '';
                        } else {
                          // If the temporary remark is empty, do not perform additional actions
                          return;
                        }

                        // Additional logic (if any) can be added here
                        // ...
                      },
                      child: Text('Cancel'),
                    ),
                  ],
                ),
),
              ]
            )
            ),
            ),
    );


  }
}


class NotFormLayout extends StatefulWidget {
  @override
  _NotFormLayoutState createState() => _NotFormLayoutState();
}

class _NotFormLayoutState extends State<NotFormLayout> {
  // Define selectedStatus variable to be used in AlertDialog
  String selectedStatus = 'Not Available';

  @override
  Widget build(BuildContext context) {
    BedStatusModel bedStatusModel = Provider.of<BedStatusModel>(context, listen: false);
    bool isRequestButtonEnabled = true;

    return Container(
      padding: EdgeInsets.all(15),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF2F348F).withOpacity(0.8),
              Color(0xFFEC2127).withOpacity(0.8),
            ],
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Bed Not Available',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: isRequestButtonEnabled
                          ? () {
                        bedStatusModel.confirmRequest();
                        bedStatusModel.markDateAsSaved();
                        bedStatusModel.updateStatus('Not Available', Colors.red);

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height: 300,
                                child: AlertDialog(
                                  title: Text('Status Confirmed'),
                                  content: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Selected Status: $selectedStatus'),

                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        bedStatusModel.notifyListeners();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => W1B(),
                                          ),
                                        );
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                          : null,
                      child: Text('Save'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
