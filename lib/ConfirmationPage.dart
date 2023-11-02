import 'package:flutter/material.dart';

class ConfirmationPage extends StatelessWidget {
  final List<int> selectedSeats;

  ConfirmationPage({required this.selectedSeats});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Confirmation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your booking is confirmed for the following seats:'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: selectedSeats
                  .map(
                    (seatNumber) => Padding(
                      padding: const EdgeInsets.all(8.0), // Add padding between seat numbers.
                      child: Text('Seat $seatNumber'),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
