import 'package:flutter/material.dart';
import 'package:hexabyte/screens/profile_screen/CreateProfilePage.dart';
import '../home_screen/widgets/home_screen_card.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../select_role_screen.dart/select_role_screen.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC5CAE9),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 16.0),
            child: HomeScreenCard(
              color: Colors.lightBlueAccent.shade700,
              imageUrl:
              "https://compliancecalendar.s3.ap-south-1.amazonaws.com/assets/latestnewsimage/MSME_crop6_thumb.jpg",
              descriptionText: "",
              sloganText: "Udyami Bharat Scheme",
              buttonText: "Click to Register",
              onTap: () async {
                const url =
                    "https://udyamregistration.gov.in/Government-India/Ministry-MSME-registration.htm";
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
              primary: Colors.indigo.shade700,
              onPrimary: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Adjust padding as needed
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Adjust border radius as needed
              ),
              elevation: 5, // Add elevation for a shadow effect
            ),
            child: Text(
              'Create Profile',
              style: TextStyle(
                fontSize: 18, // Adjust text size as needed
              ),
            ),
          )

        ],
      ),
    );
  }
}
