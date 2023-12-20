import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wsm_app/widgets/sidemenu.dart';

import 'Bed.dart';
import 'Model/BedStatusModel.dart';



class FilterScreen extends StatelessWidget{

  final List<Bed> beds;

  FilterScreen({required this.beds});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
              height: 50,
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
                  bottomRight: Radius.circular(0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20), // Add some space between the text and buttons

              // ElevatedButton for 'Ready' status
              ElevatedButton(
                onPressed: () {
                  // Handle 'Ready' button press
                },
                child: Text('Ready'),
              ),
                  SizedBox(width: 10),
                  // ElevatedButton for 'Occupied' status
              ElevatedButton(
                onPressed: () {
                  // Handle 'Occupied' button press
                },
                child: Text('Occupied'),
              ),
                  SizedBox(width: 10),
                  // ElevatedButton for 'Carbolized' status
              ElevatedButton(
                onPressed: () {
                  // Handle 'Carbolized' button press
                },
                child: Text('Carbolized'),

              ),
                ],
              ),
            ),
            SizedBox(height: 5),


            SizedBox(height: 5),

           /* Center(
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
            ),*/
          ],
        ),
      ),
    );
  }
}


