import 'package:flutter/material.dart';

import 'PostjobPage.dart';
import 'SearchJobPage.dart';

class JobPortalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Portal'),
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
                // Navigate to Post Job page (you can replace this with your actual page)
                Navigator.push(context, MaterialPageRoute(builder: (context) => JobPostPage()));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.amber.shade700, // Gold theme
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text(
                'Post Job',
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
                // Navigate to Search Job page (you can replace this with your actual page)
                Navigator.push(context, MaterialPageRoute(builder: (context) => JobSearchPage()));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.amber.shade700, // Gold theme
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text(
                'Search Job',
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

// Placeholder pages for Post Job and Search Job



