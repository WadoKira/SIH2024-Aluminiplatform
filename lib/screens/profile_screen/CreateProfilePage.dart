import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hexabyte/screens/select_role_screen.dart/select_role_screen.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../layout/nav_layout.dart';
import '../../screens/order_history_screen/api/order_history_api.dart';
import '../../screens/order_history_screen/widgets/order_history_card.dart';

import 'package:flutter/material.dart';

class CreateProfilePage extends StatefulWidget {
  @override
  _CreateProfilePage createState() => _CreateProfilePage();
}

class _CreateProfilePage extends State<CreateProfilePage> {
  // Variables to store user input
  String Name = '';
  String Address = '';
  late int Age;
  late int Phno ;

  // Form key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  Name = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'MSME ID'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter MSME ID';
                  }
                  return null;
                },
                onSaved: (value) {
                  Phno = value! as int;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Age'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Age';
                  }
                  return null;
                },
                onSaved: (value) {
                  Age = value! as int;
                },
              ),


              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Use the values stored in variables (franchiseName, contactInfo, etc.)
                    // for further processing, e.g., sending to a database.
                    // You can also navigate to another screen or perform any other action here.
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Submitted Data'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Name: $Name'),
                              Text('Address: $Address'),
                              Text('Age: $Age'),
                              Text('Phno: $Phno'),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                    createProfile(Name, Address,Age as String ,Phno);
                  }
                },
                child: Text('Submit'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SelectRoleScreen(),
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
                  'Continue Further',
                  style: TextStyle(
                    fontSize: 18, // Adjust text size as needed
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Future<CreateProfile> createProfile(String Name, String Address, String Age, int Phno) async {
    final http.Response response = await http.post(
      Uri.parse('https://wastes-api.onrender.com/api/Customer/store'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "Name" : Name,
        "Address": Address,
        "Age": Age,
        "Phno": Phno,
      }),
    );
    if (response.statusCode == 201) {
      return CreateProfile.fromJson(json.decode(response.body));
    } else {
      throw Exception('Franchise loading failed!');
    }
  }
}
class CreateProfile {
  final int Phno;
  final String Name;
  final String Address;
  final int Age;

  CreateProfile({required this.Address, required this.Name, required this.Phno, required this.Age});

  factory   CreateProfile.fromJson(Map<String, dynamic> json) {
    return   CreateProfile(
      Address: json["Address"],
      Name: json['Name'],
      Phno: json["Phno"],
      Age: json["Age"],
    );
  }
}