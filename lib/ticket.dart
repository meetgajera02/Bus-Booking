import 'package:flutter/material.dart';

class ticket extends StatelessWidget {
  ticket({super.key, required this.selectedSeats});

  DateTime time = DateTime.now();
  final List<int> selectedSeats;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFeeedf2),
        appBar: AppBar(
            backgroundColor: Color(0xfffa5951),
            title: Text("Reservation detial",
                style: TextStyle(color: Colors.white)),
            leading: BackButton(
              onPressed: () => Navigator.pop(context, false),
              color: Colors.white,
            )),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Center(child: Text('Confirmed Date: ${time}')),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(children: [
                Row(
                  children: [
                    Text("From: ",
                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                    Text('Rajkot'),
                    Spacer(),
                    Text("To: ",
                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                    Text('Surat')
                  ],
                ),
                SizedBox(height: 20),
                Divider(),
                SizedBox(height: 20),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bus Name", style: TextStyle(fontSize: 18)),
                        Text("Shreeji Travels",
                            style: TextStyle(fontSize: 18, color: Colors.grey)),
                        SizedBox(height: 20),
                        Text("Ticket ID", style: TextStyle(fontSize: 18)),
                        Text("LA3264512",
                            style: TextStyle(fontSize: 18, color: Colors.grey)),
                        SizedBox(height: 20),
                        Text("Age", style: TextStyle(fontSize: 18)),
                        Text("25",
                            style: TextStyle(fontSize: 18, color: Colors.grey)),
                      ],
                    ),
                    SizedBox(width: 80),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Boarding Time", style: TextStyle(fontSize: 18)),
                        Text("20:00",
                            style: TextStyle(fontSize: 18, color: Colors.grey)),
                        SizedBox(height: 20),
                        Text("Seat No", style: TextStyle(fontSize: 18)),
                        Row(
                          children: selectedSeats
                              .map(
                                (seatNumber) => Padding(
                                  padding: const EdgeInsets.all(
                                      1.0), // Add padding between seat numbers.
                                  child: Text('$seatNumber, ',style: TextStyle(fontSize: 18, color: Colors.grey),),
                                ),
                              )
                              .toList(),
                        ),
                        SizedBox(height: 20),
                        Text("Members", style: TextStyle(fontSize: 18)),
                        Text("1",
                            style: TextStyle(fontSize: 18, color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Divider(),
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(Icons.person),
                    Text('Mr, Meet Gajera', style: TextStyle(fontSize: 18)),
                    Spacer(),
                    Text("Total Fare",
                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("₹ 500.00",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 17, 16, 87),
                        ))
                  ],
                )
              ]),
            )
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 84,
          child: BottomAppBar(
            elevation: 64,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      minimumSize: Size(150,0),
                        textStyle: TextStyle(fontSize: 24),
                        primary: Colors.pink,
                        onPrimary: Colors.black),
                    onPressed: () {},
                    child: Center(
                      child: Text("Cancle",
                          style: TextStyle(
                              
                              color: Colors.white,
                             )),
                    ),
                  ),
                  SizedBox(width: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      minimumSize: Size(163, 40),
                        textStyle: TextStyle(fontSize: 24),
                        primary: Colors.pink,
                        onPrimary: Colors.black),
                    onPressed: () {},
                    child: Center(
                      child: Text("Download",
                          style: TextStyle(
                             
                              color: Colors.white,
                              )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
