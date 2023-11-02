//import 'package:bus/Account/personal.dart';
//import 'package:bus/screens/home.dart';
//import 'package:bus/screens/home_screen.dart';
import 'ticket.dart';
import 'package:flutter/material.dart';

class booking extends StatefulWidget {
  const booking({super.key});

  @override
  State<booking> createState() => _bookingState();
}

class _bookingState extends State<booking> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 2,
    child: Scaffold(
      backgroundColor: Color(0xFFeeedf2),
      appBar: AppBar(
        backgroundColor: Color(0xfffa5951),
        title:  Text("Booking",style: TextStyle(fontSize: 26,color:Color.fromARGB(255, 255, 255, 255),fontWeight: FontWeight.w400),),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              color: Colors.white,
              child: const TabBar(
                tabs: [
                  Tab(text: ("COMPLETED")),
                  Tab(text: ("CANCELLED"))
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              height: 60,
              child: TabBarView(
                children: [
                  Container(
                    child: ListTile(
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ticket(selectedSeats: [],)));},
                      leading: Container(
                        width: 319,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white
                        ),
                        child: Center(child: Text('SHOW BOOKINGS',style: TextStyle(fontSize: 18))),
                      ),
                    ),
                  ),Container(
                    child: ListTile(
                      onTap: (){},
                      leading: Container(
                        width: 319,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white
                        ),
                        child: Center(child: Text('SHOW BOOKINGS',style: TextStyle(fontSize: 18))),
                      ),
                    ),
                  )
                ]
              ),
            )
          ],
        ),
      )
    ),
  );  
}