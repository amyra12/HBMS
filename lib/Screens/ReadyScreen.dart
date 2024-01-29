import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Bed.dart';
import '../Model/BedStatusModel.dart';
import '../Model/BedStatusModelW1GB2.dart';
import '../widgets/sidemenu.dart';

class ReadyScreen extends StatelessWidget{
  final List<Bed> beds;

  ReadyScreen({required this.beds});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    BedStatusModel bedStatusModel = Provider.of<BedStatusModel>(context);

    // Access the BedStatusModelW1GB2Provider
    BedStatusModelW1GB2 bedStatusModelW1GB2 = Provider.of<BedStatusModelW1GB2>(context);
    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        title: Text(
          " ",
          style: TextStyle(
            color: Colors.white, // Adjusted title text color
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF2F348F).withOpacity(0.8),
                Color(0xFFEC2127).withOpacity(0.8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),

        ),

      ),
      body: Container(
        //padding: EdgeInsets.all(1),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
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
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(80),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Status',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'READY',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),


              SizedBox(height: 5),

              Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: ListView(
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          children: [
                            if (bedStatusModel.selectedStatus.text != 'Carbolised'&& bedStatusModel.selectedStatus.text != 'Occupied')
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.lightGreenAccent,
                                  border: Border.all(
                                    color: Colors.lightGreen,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: ListTile(
                                  title: Text(
                                    'GroundFloor, Ward 1, Bed 1',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Status: ${bedStatusModel.selectedStatus.text}',
                                      ),
                                      Text(
                                        'Patient Admit: ${bedStatusModel.selectedAdmitDate.toLocal().toString().split(' ')[0]}',
                                      ),
                                      Text(
                                        'Patient Discharge: ${bedStatusModel.selectedDischargeDate.toLocal().toString().split(' ')[0]}',
                                      ),
                                      // Add more details from BedStatusModel as needed
                                    ],
                                  ),
                                ),
                              ),
                            SizedBox(height: 10),
                            if (bedStatusModelW1GB2.selectedStatus.text != 'Carbolised' && bedStatusModelW1GB2.selectedStatus.text != 'Occupied')
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.lightGreenAccent,
                                  border: Border.all(
                                    color: Colors.lightGreen,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: ListTile(
                                  title: Text(
                                    'GroundFloor, Ward 1, Bed 2',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Status: ${bedStatusModelW1GB2.selectedStatus.text}',
                                      ),
                                      Text(
                                        'Patient Admit: ${bedStatusModelW1GB2.selectedAdmitDate.toLocal().toString().split(' ')[0]}',
                                      ),
                                      Text(
                                        'Patient Discharge: ${bedStatusModelW1GB2.selectedDischargeDate.toLocal().toString().split(' ')[0]}',
                                      ),
                                      // Add more details from BedStatusModel as needed
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
    ],
    ),
      ),
    );

  }

}