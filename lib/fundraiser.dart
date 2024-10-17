import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FundRaiserPage extends StatefulWidget {
  @override
  _FundRaiserPageState createState() => _FundRaiserPageState();
}

class _FundRaiserPageState extends State<FundRaiserPage> {
  // Variables to store user input
  String name = '';
  String eventName = '';
  String eventDescription = '';
  String approxAmount = '';
  String alumniEmail = '';

  // Form key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Fund Raiser', style: TextStyle(color: Colors.amber.shade700)),
      ),
      backgroundColor: Colors.black, // Black background
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                style: TextStyle(color: Colors.amber.shade700),
                decoration: InputDecoration(
                  labelText: 'Your Name',
                  labelStyle: TextStyle(color: Colors.amber.shade700),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber.shade700),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber.shade700),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  name = value!;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                style: TextStyle(color: Colors.amber.shade700),
                decoration: InputDecoration(
                  labelText: 'Event Name',
                  labelStyle: TextStyle(color: Colors.amber.shade700),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber.shade700),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber.shade700),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter event name';
                  }
                  return null;
                },
                onSaved: (value) {
                  eventName = value!;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                style: TextStyle(color: Colors.amber.shade700),
                decoration: InputDecoration(
                  labelText: 'Event Description',
                  labelStyle: TextStyle(color: Colors.amber.shade700),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber.shade700),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber.shade700),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter event description';
                  }
                  return null;
                },
                onSaved: (value) {
                  eventDescription = value!;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                style: TextStyle(color: Colors.amber.shade700),
                decoration: InputDecoration(
                  labelText: 'Approx Amount',
                  labelStyle: TextStyle(color: Colors.amber.shade700),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber.shade700),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber.shade700),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty || int.tryParse(value) == null) {
                    return 'Please enter a valid amount';
                  }
                  return null;
                },
                onSaved: (value) {
                  approxAmount = value!;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                style: TextStyle(color: Colors.amber.shade700),
                decoration: InputDecoration(
                  labelText: 'Alumni Email',
                  labelStyle: TextStyle(color: Colors.amber.shade700),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber.shade700),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber.shade700),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onSaved: (value) {
                  alumniEmail = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    try {
                      await createFundraiser(name, eventName, eventDescription, approxAmount, alumniEmail);
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.black,
                            title: Text('Success', style: TextStyle(color: Colors.amber.shade700)),
                            content: Text('Fundraiser created successfully!', style: TextStyle(color: Colors.amber.shade700)),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK', style: TextStyle(color: Colors.amber.shade700)),
                              ),
                            ],
                          );
                        },
                      );
                    } catch (e) {
                      print('Error: $e');
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.black,
                            title: Text('Error', style: TextStyle(color: Colors.red)),
                            content: Text('Failed to create fundraiser. Please try again later.', style: TextStyle(color: Colors.red)),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK', style: TextStyle(color: Colors.amber.shade700)),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber.shade700, // Button color set to gold
                  onPrimary: Colors.black, // Black text on the button
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text('Submit', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to create a fundraiser by making an API call
  Future<void> createFundraiser(String name, String eventName, String eventDescription, String approxAmount, String alumniEmail) async {
    final http.Response response = await http.post(
      Uri.parse('https://fundraiser-zocy.onrender.com/api/fundraiser/store'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "your_name": name,
        "event_name": eventName,
        "event_description": eventDescription,
        "approximate_amount": int.parse(approxAmount),
        "email": alumniEmail,
      }),
    );

    print('Response body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Fundraiser creation successful. Status code: ${response.statusCode}');
    } else {
      print('Failed to create fundraiser. Status code: ${response.statusCode}');
      throw Exception('Fundraiser creation failed!');
    }
  }
}
