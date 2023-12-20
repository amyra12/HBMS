import 'package:flutter/material.dart';

import '../../widgets/sidemenu.dart';
import '../Ward1G.dart';

class GWard3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: SideMenu(),
        appBar: AppBar(
          title: Text("Ward 3",
            style: TextStyle(
                color: Colors.white
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF2F348F),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              GridView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Ward()),
                      );
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(10), // Apply radius of 10
                      ),
                      child: Center(
                        child: Text('BED 1', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold,),),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Ward()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(10), // Apply radius of 10
                      ),
                      child: Center(
                        child: Text('BED 2', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold,),),
                      ),
                    ),

                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Ward()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(10), // Apply radius of 10
                      ),
                      child: Center(
                        child: Text('BED 2', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold,),),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>Ward()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(10), // Apply radius of 10
                      ),
                      child: Center(
                        child: Text('BED 3', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold,),),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Ward()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(10), // Apply radius of 10
                      ),
                      child: Center(
                        child: Text('BED 4', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold,),),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Ward()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(10), // Apply radius of 10
                      ),
                      child: Center(
                        child: Text('BED 5', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold,),),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Ward()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(10), // Apply radius of 10
                      ),
                      child: Center(
                        child: Text('BED 6', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold,),),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Ward()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(10), // Apply radius of 10
                      ),
                      child: Center(
                        child: Text('BED 7', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold,),),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Ward()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(10), // Apply radius of 10
                      ),
                      child: Center(
                        child: Text('BED 9', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold,),),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Ward()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(10), // Apply radius of 10
                      ),
                      child: Center(
                        child: Text('BED 10', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold,),),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }

}