import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Corrected import for URL launching
import '../../screens/home_screen/widgets/home_screen_card.dart';
import 'Donation_page.dart';
import 'FeedbacksurveyPage.dart';
import 'JobportalPage.dart';
import 'Recommendationpage.dart'; // Ensure HomeScreenCard is correctly imported

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Smart Search',
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0), // Adjust padding as needed
                child: Image.asset(
                  'assets/IMG_6816.PNG', // Replace with your image path
                  width: 24, // Adjust the size of the image
                  height: 24,
                ),
              ),
              hintStyle: TextStyle(color: Colors.black),
            ),
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber.shade700,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.recommend),
              title: Text('Recommendation'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RecommendationPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Donation'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DonationPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.work),
              title: Text('Job Portal'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => JobPortalPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.feedback),
              title: Text('Feedback & Survey'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FeedbackSurveyPage()));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container with the YouTube link for the Alumni Achievement Award
            Container(
              margin: EdgeInsets.only(bottom: 16.0), // Adjust margin as needed
              child: HomeScreenCard(
                color: Colors.lightBlueAccent.shade700,
                imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHwPKAq_zSGl2RiUEE6gU4LBKwcQ3IPK-3zw&s", // Thumbnail image of the video
                descriptionText: "Alumni Achievement Award Ceremony",
                sloganText: "Watch the Alumni Achievement Award",
                buttonText: "Click to watch",
                onTap: () async {
                  const url = "https://www.youtube.com/watch?v=0vjeZPG-Af4"; // Alumni achievement video link
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw "Could not launch $url";
                  }
                },
              ),
            ),
            // Text and other features on the home page
            Center(
              child: Text(
                'Welcome to the Alumni Home Page!',
                style: TextStyle(fontSize: 24, color: Colors.amber.shade700),
              ),
            ),
            // Additional Cards or widgets
            SizedBox(height: 20),
            // Example of another HomeScreenCard for additional features
            HomeScreenCard(
              color: Colors.amber.shade700,
              imageUrl:
              "https://img.freepik.com/free-vector/job-application-concept-illustration_114360-2579.jpg?w=2000",
              descriptionText: "Make a difference today!",
              sloganText: "Donation Page",
              buttonText: "Donate Now",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DonationPage()));
              },
            ),
            SizedBox(height: 20),
            HomeScreenCard(
              color: Colors.purpleAccent.shade700,
              imageUrl:
              "https://img.freepik.com/free-vector/job-application-concept-illustration_114360-2579.jpg?w=2000",
              descriptionText: "Find your dream job",
              sloganText: "Job Portal",
              buttonText: "Explore Jobs",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => JobPortalPage()));
              },
            ),
            SizedBox(height: 20),
            HomeScreenCard(
              color: Colors.green.shade700,
              imageUrl:
              "https://img.freepik.com/free-vector/job-application-concept-illustration_114360-2579.jpg?w=2000",
              descriptionText: "Give us your feedback",
              sloganText: "Feedback & Survey",
              buttonText: "Start Survey",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FeedbackSurveyPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
