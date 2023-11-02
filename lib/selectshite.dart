import 'package:flutter/material.dart';

import 'ticket.dart';

class BusBookingPage extends StatefulWidget {
  @override
  _BusBookingPageState createState() => _BusBookingPageState();
}

class _BusBookingPageState extends State<BusBookingPage> {

  List<bool> isSeatBooked = List.generate(32, (index) => false);
  List<int> selectedSeats = []; // Initialize as an empty list.

  void toggleSeatStatus(int seatIndex) {
    setState(() {
      if (isSeatBooked[seatIndex]) {
        selectedSeats.remove(seatIndex + 1); // Remove seat number from selectedSeats.
      } else {
        selectedSeats.add(seatIndex + 1); // Add seat number to selectedSeats.
      }
      isSeatBooked[seatIndex] = !isSeatBooked[seatIndex];
    });
  }

  void confirmBooking() {
    if (selectedSeats.isNotEmpty) {
      // At least one seat is selected, so navigate to the ConfirmationPage with selected seat numbers.
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ticket(selectedSeats: selectedSeats),
        ),
      );
    } else {
      // Handle the case where no seats are selected.
      print('No seats selected for booking.');
    }
  }

  void cancelBooking() {
    setState(() {
      isSeatBooked = List.generate(32, (index) => false); // Reset all seats to unbooked.
    });
    print('Booking canceled');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfffa5951),
        title: Text("Select Shite"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
            padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                       border: Border.all(
                        color: Colors.red,
                        width: 2.0
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Text("booked",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                  Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                        width: 2.0
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Text("Shite",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                  
                ],
              )
          ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top:10.0,left:30.0,right:30.0), // Add space at the bottom
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // Change this to match your layout
                    crossAxisSpacing: 25.0,
                    mainAxisSpacing: 25.0,
                  ),
                  itemCount: isSeatBooked.length,
                  itemBuilder: (context, index) {
                    return ElevatedButton(
                      onPressed: () {
                        toggleSeatStatus(index);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: isSeatBooked[index] ? Colors.red : Colors.green,)
                        ),
                        primary: Colors.white ,
                        // Set the minWidth and minHeight to make the button square.
                        minimumSize: Size.square(40.0),
                        fixedSize: Size.square(20)  // Adjust the size as needed.
                      ),
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 84,
        child: BottomAppBar(
          elevation: 64,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
            child: Row(
              children: [
                Text("Seat(1/1)",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                SizedBox(width: 30),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(350, 60),
                      textStyle: TextStyle(fontSize: 24),
                      primary: Colors.red,
                    ),
                    onPressed: confirmBooking,
                    child: Text("Confirm",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold))
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
