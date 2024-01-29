import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Model/BedStatusModel.dart';


class BH1B1 extends StatefulWidget{
  @override
  State<BH1B1> createState() => _BH1B1();




}

class _BH1B1 extends State<BH1B1>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    BedStatusModel bedStatusModel = Provider.of<BedStatusModel>(context, listen: true);
    String CtemporaryRemark = '';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
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

      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              'Carbolised History',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),








          ],
        ),
      ),


            SingleChildScrollView(

              child: Padding(
                  padding: const EdgeInsets.all(10.0),

                child: Column(

                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Align containers at the start of the row
                        children: [
                          Container(
                              width: MediaQuery
                                        .of(context)
                                        .size.width*0.9,     
                                   height: 150,
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.deepPurpleAccent, // Specify the border color here
                                  width: 2.0,           // Specify the border width here
                                ),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black38.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: Offset(3, 3),
                                  ),
                                ],// Apply radius of 10
                              ),
                              padding: EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Time Stamp: ',
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 2),

                                      Text(
                                        bedStatusModel.isDateCleanSaved()
                                            ? bedStatusModel.getSelectedCleanDate().toLocal().toString().split(' ')[0]
                                            : 'Select a date',
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 10,),
                                      Text(
                                        '&',
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        bedStatusModel.isTimeCleanSaved()
                                            ? bedStatusModel.getSelectedCleanTime().format(context)
                                            : 'Select a time',
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),

                                  Row(
                                    children: [
                                      Text(
                                        'Carbolised by: ',
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 2),
                                      // Check if the bed status is "Occupied" before displaying the admit date
                                      //if (Provider.of<BedStatusModel>(context).selectedStatus.text == 'Occupied')
                                      Consumer<BedStatusModel>(
                                        builder: (context, bedStatusModel, _) {
                                          String? selectedNameText = bedStatusModel.selectedName?.text;

                                          if (selectedNameText == null || selectedNameText.isEmpty) {
                                            selectedNameText = 'Have not decided';
                                          }

                                          return Text(
                                            selectedNameText,
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          );
                                        },
                                      ),


                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Row(
                                    children: [
                                      Text(
                                          'Remark:',
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      SizedBox(width: 5,),
                                      Consumer<BedStatusModel>(
                                        builder: (context, bedStatusModel, child) {
                                          return Text(
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
                                                : 'No remark'),
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          );
                                        },

                                      ),
                                    ],
                                  )
                                ],

                              ),
                            ),
                          )
                        ],
                      ),



    ]
        ),
    ),




    )

    ]
    )
    )
    )
    );

  }
}