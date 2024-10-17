import 'package:flutter/material.dart';
import '../../create_profile_page.dart';
import '../../home_page.dart';
import '../home_screen/widgets/home_screen_card.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../select_role_screen.dart/select_role_screen.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Changed background to black
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 16.0),
            child: HomeScreenCard(
              color: Colors.amber.shade700, // Changed card color to gold
              imageUrl:
              "https://mdcollege.in/wp-content/uploads/2021/07/alumini.png", // Keep the same alumni image or update as needed
              descriptionText: "",
              sloganText: "SVCE Alumni Network", // Updated slogan text
              buttonText: "Visit SVCE",
              onTap: () async {
                const url = "https://www.svce.ac.in"; // Link to SVCE
                if (await canLaunchUrlString(url)) {
                  await launchUrlString(url);
                } else {
                  throw "Could not launch $url";
                }
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CreateProfilePage(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.amber.shade700, // Button color changed to gold
              onPrimary: Colors.black, // Text color changed to black
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5, // Shadow effect
            ),
            child: Text(
              'Create Profile',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold, // Added bold for emphasis
              ),
            ),
          ),
          SizedBox(height: 16.0), // Add space between the buttons
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomePage(), // Redirects to HomePage
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.amber.shade700, // Button color changed to gold
              onPrimary: Colors.black, // Text color changed to black
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5, // Shadow effect
            ),
            child: Text(
              'Go to Home Page',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold, // Added bold for emphasis
              ),
            ),
          )

        ],
      ),
    );
  }
}
