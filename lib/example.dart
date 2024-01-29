import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Model/BedStatusModel.dart';
import 'Model/BedStatusModelW1GB2.dart';


class example extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // Access the BedStatusModelProvider
    BedStatusModel bedStatusModel = Provider.of<BedStatusModel>(context);

    // Access the BedStatusModelW1GB2Provider
    BedStatusModelW1GB2 bedStatusModelW1GB2 = Provider.of<BedStatusModelW1GB2>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Activity Screen'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          if (bedStatusModel.selectedStatus.text != 'Ready')
            Container(

              decoration: BoxDecoration(
                color: Colors.orangeAccent, // Change the color of the entire ListTile
                border: Border.all(
                  color: Colors.orange, // Specify the border color
                  width: 2.0, // Specify the border width
                ),
                borderRadius: BorderRadius.circular(8.0), // Add rounded corners
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
          Divider(),
          if (bedStatusModelW1GB2.selectedStatus.text != 'Ready')
            Container(
              decoration: BoxDecoration(
                color: Colors.orangeAccent, // Change the color of the entire ListTile
                border: Border.all(
                  color: Colors.orange, // Specify the border color
                  width: 2.0, // Specify the border width
                ),
                borderRadius: BorderRadius.circular(8.0), // Add rounded corners
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
    );
  }
}