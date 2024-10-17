import 'package:flutter/material.dart';

import 'funddonar.dart';
import 'fundraiser.dart';

class DonationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donation'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FundRaiserPage()));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.amber.shade700, // Gold theme
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text(
                'Raise Fund',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Black text
                ),
              ),
            ),
            SizedBox(height: 16.0), // Spacing between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DonateFundPage()));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.amber.shade700, // Gold theme
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text(
                'Donate Fund',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Black text
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Placeholder pages for Fund Raiser and Donate Fund


