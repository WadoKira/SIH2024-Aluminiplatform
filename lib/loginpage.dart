import 'package:flutter/material.dart';
import 'package:hexabyte/screens/Welcome/Welcome.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  final String defaultOTP = "123456"; // Default OTP

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Login",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.amber.shade700,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 32),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  labelStyle: TextStyle(color: Colors.grey.shade400),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade700),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber.shade700),
                  ),
                  hintText: 'Enter your phone number',
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _otpController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "OTP",
                  labelStyle: TextStyle(color: Colors.grey.shade400),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade700),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber.shade700),
                  ),
                  hintText: 'Enter OTP (default: 123456)',
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (_otpController.text == defaultOTP) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => WelcomePage()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Invalid OTP! Please try again.')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber.shade700,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

