import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'home_page.dart';

class CreateProfilePage extends StatefulWidget {
  @override
  _CreateProfilePageState createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  // Variables to store user input
  String name = '';
  String address = '';
  int age = 0;
  int phno = 0;

  // Dropdown variables
  String selectedRole = 'Alumni'; // Default value for role
  String selectedYear = '2023'; // Default passing year

  // Form key
  final _formKey = GlobalKey<FormState>();

  // List of years for the year dropdown
  final List<String> years = List<String>.generate(50, (i) => (1975 + i).toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Create Profile', style: TextStyle(color: Colors.amber.shade700)),
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
                  labelText: 'Name',
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
                  labelText: 'Address',
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
                    return 'Please enter your address';
                  }
                  return null;
                },
                onSaved: (value) {
                  address = value!;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                style: TextStyle(color: Colors.amber.shade700),
                decoration: InputDecoration(
                  labelText: 'Age',
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
                    return 'Please enter a valid age';
                  }
                  return null;
                },
                onSaved: (value) {
                  age = int.parse(value!);
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                style: TextStyle(color: Colors.amber.shade700),
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(color: Colors.amber.shade700),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber.shade700),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber.shade700),
                  ),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 10) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
                onSaved: (value) {
                  phno = int.parse(value!);
                },
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedRole,
                dropdownColor: Colors.black,
                decoration: InputDecoration(
                  labelText: 'Role',
                  labelStyle: TextStyle(color: Colors.amber.shade700),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber.shade700),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber.shade700),
                  ),
                ),
                items: <String>['Alumni', 'Student'].map((String role) {
                  return DropdownMenuItem<String>(
                    value: role,
                    child: Text(role, style: TextStyle(color: Colors.amber.shade700)),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedRole = newValue!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a role';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              if (selectedRole == 'Alumni')
                DropdownButtonFormField<String>(
                  value: selectedYear,
                  dropdownColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: 'Year of Passing',
                    labelStyle: TextStyle(color: Colors.amber.shade700),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber.shade700),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber.shade700),
                    ),
                  ),
                  items: years.map((String year) {
                    return DropdownMenuItem<String>(
                      value: year,
                      child: Text(year, style: TextStyle(color: Colors.amber.shade700)),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedYear = newValue!;
                    });
                  },
                  validator: (value) {
                    if (selectedRole == 'Alumni' && (value == null || value.isEmpty)) {
                      return 'Please select your year of passing';
                    }
                    return null;
                  },
                ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Debugging: Print the form data before hitting the API
                    print("Form Data: Name: $name, Address: $address, Age: $age, Phone: $phno, Role: $selectedRole, Year: $selectedYear");

                    try {
                      Profile profile = await createProfile(name, address, age, phno, selectedRole, selectedYear);
                      // Debugging: Print API response
                      print('Profile Created: ${profile.name}');
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.black,
                            title: Text('Profile Created', style: TextStyle(color: Colors.amber.shade700)),
                            content: Text('Your profile has been successfully created!', style: TextStyle(color: Colors.amber.shade700)),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => HomePage(),
                                    ),
                                  );
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
                            content: Text('Failed to create profile. Please try again later.', style: TextStyle(color: Colors.red)),
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
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.indigo.shade700,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                ),
                child: Text(
                  'Continue Further',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to create a profile by making an API call
  Future<Profile> createProfile(String name, String address, int age, int phno, String role, String passingYear) async {
    final http.Response response = await http.post(
      Uri.parse('https://sih2024profilepage1.onrender.com/api/alumni/store'), // API URL updated
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "name": name,
        "address": address,
        "age": age,
        "phno": phno,
        "role": role,
        "year_of_passing": passingYear,
      }),
    );

    print('Response body: ${response.body}'); // Debugging: Print the response body

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Profile creation successful. Status code: ${response.statusCode}');
      return Profile.fromJson(json.decode(response.body));
    } else {
      print('Failed to create profile. Status code: ${response.statusCode}');
      throw Exception('Profile creation failed!');
    }
  }


}

class Profile {
  final String name;
  final String address;
  final int age;
  final int phno;
  final String role;
  final String yearOfPassing;

  Profile({
    required this.name,
    required this.address,
    required this.age,
    required this.phno,
    required this.role,
    required this.yearOfPassing,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['name'] ?? '', // Use default value if null
      address: json['address'] ?? '', // Use default value if null
      age: json['age'] ?? 0, // Use default value if null
      phno: json['phno'] ?? 0, // Use default value if null
      role: json['role'] ?? '', // Use default value if null
      yearOfPassing: json['year_of_passing'] ?? '', // Use default value if null
    );
  }
}
