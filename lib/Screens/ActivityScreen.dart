import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/BedStatusModel.dart';
import '../widgets/sidemenu.dart';

class Bed {
  final int id;
  final String status;
  final String location;
  final String admitDate;
  final String leaveDate;

  Bed({
    required this.id,
    required this.status,
    required this.location,
    required this.admitDate,
    required this.leaveDate,
  });
}

class ActivityScreen extends StatelessWidget {
  final List<Bed> beds;

  ActivityScreen({required this.beds});

  @override
  Widget build(BuildContext context) {
    //List<Bed> bedsToCarbolize = beds.where((bed) => bed.status == 'Carbolised').toList();
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
                    'Need to',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Carbolise',
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
            Container(
              height: 40,
              width: 100,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Latest',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 5),

            Center(
              child: SingleChildScrollView(
                child: Container(
                  width: 330,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.orange, // Border color
                      width: 2.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(10.0), // Border radius
                    color: Colors.orangeAccent, // Container background color
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                  if (Provider.of<BedStatusModel>(context).showCarbolizeInfo) ...[
                // Your additional information for Carbolized state
                            Text(
                            'Location: GF, Ward 1, Bed 1',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Patient Admit: ...',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Patient Leave: ...',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                            ),
                          ),
                          ],

                      SizedBox(height: 5),
                      Container(
                              alignment: Alignment.center,
                              child: Visibility(
                              visible: !Provider.of<BedStatusModel>(context).showCarbolizeInfo,
                              child: Text(
                              'No beds need to be carbolized.',
                              style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                      ),
                      ),
                      ),
                      ),
                      ],
                      ),
                ),
                ),
              ),
              ],
              ),
              ),
              );
  }
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Bed> beds = [
      Bed(id: 1, status: 'Ready', location: 'Room A', admitDate: '2023-01-01', leaveDate: '2023-01-05'),
      Bed(id: 2, status: 'Carbolised', location: 'Room B', admitDate: '2023-01-02', leaveDate: '2023-01-06'),
      // Add more bed entries as needed
    ];

    return MaterialApp(
      home: ActivityScreen(beds: beds),
    );
  }
}