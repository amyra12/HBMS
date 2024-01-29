import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wsm_app/Model/BedStatusModelW1GB3.dart';


class W1GB3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Save Confirmation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Select Status:'),
            SizedBox(height: 10),
            // DropdownButton for selecting status
            Consumer<BedStatusModelW1GB3>(
              builder: (context, bedStatusModelW1GB3, child) {
                return DropdownButton<String>(
                  value: bedStatusModelW1GB3.selectedStatus,
                  items: ['Ready', 'Occupied', 'Not Available'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      bedStatusModelW1GB3.updateStatus(newValue);
                    }
                  },
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Access the BedStatusModel using Provider and update the status/color
                BedStatusModelW1GB3 bedStatusModelW1GB3 = Provider.of<BedStatusModelW1GB3>(context, listen: false);
                String selectedStatus = bedStatusModelW1GB3.selectedStatus;

                // Set the flag to indicate that the request is confirmed
                bedStatusModelW1GB3.confirmRequest();

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
                            bedStatusModelW1GB3.notifyListeners();

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
    );
  }
}
