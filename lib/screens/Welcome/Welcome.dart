import '../../screens/RegistrationPage/RegistrationPage.dart';
import 'package:flutter/material.dart';
import '../../screens/select_role_screen.dart/select_role_screen.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Changed background color to black
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Welcome to Alumni Connect",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.amber.shade700, // Changed text color to gold
              ),
            ),
            SizedBox(height: 16),
            Image.asset(
              "assets/Welcome.png", // Update the asset to match alumni branding
              width: 300,
              height: 300,
            ),
            SizedBox(height: 16),
            Text(
              "Bridging Futures Together!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade400, // Text color for secondary text
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RegistrationPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.amber.shade700, // Button color set to gold
                onPrimary: Colors.black, // Text color set to black
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Get Started",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
