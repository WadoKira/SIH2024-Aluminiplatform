import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../layout/nav_layout.dart';
import '../../screens/order_history_screen/api/order_history_api.dart';
import '../../screens/order_history_screen/widgets/order_history_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class LogisticsPage extends StatefulWidget {
  @override
  _LogisticsPageState createState() => _LogisticsPageState();
}

class _LogisticsPageState extends State<LogisticsPage> {
  // Variables to store user input
  String name = '';
  String Parties_Involved = '';
  String Cost_Fee = '';
  String Transporting_Vehicle = '';
  String Source_Departure = '';
  String Contact_Info = '';

  // Form key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logistics Page'),
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
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) {
                  name = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Parties Involved'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter parties involved';
                  }
                  return null;
                },
                onSaved: (value) {
                  Parties_Involved = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Cost/Fee'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter cost/fee';
                  }
                  return null;
                },
                onSaved: (value) {
                  Cost_Fee = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Transporting Vehicle'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter transporting vehicle';
                  }
                  return null;
                },
                onSaved: (value) {
                  Transporting_Vehicle = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Source/Departure'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter source/departure';
                  }
                  return null;
                },
                onSaved: (value) {
                  Source_Departure = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Contact Info'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter contact info';
                  }
                  return null;
                },
                onSaved: (value) {
                  Contact_Info = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Use the values stored in variables (name, Parties_Involved, etc.)
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
                              Text('Name: $name'),
                              Text('Parties Involved: $Parties_Involved'),
                              Text('Cost/Fee: $Cost_Fee'),
                              Text('Transporting Vehicle: $Transporting_Vehicle'),
                              Text('Source/Departure: $Source_Departure'),
                              Text('Contact Info: $Contact_Info'),
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
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
Future<Logistics> createLogistics(String name, String Parties_Involved, int Contact_Info, String Cost_Fee, String Transporting_Vehicle, String Source_Departure) async {
  final http.Response response = await http.post(
    Uri.parse('https://logistics-api-utlh.onrender.com/api/Logistics/store'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "Name" : name,
      "Contact_Info": Contact_Info,
      "Parties_Involved": Parties_Involved,
      "Cost_Fee": Cost_Fee,
      "Transporting_Vehicle":Transporting_Vehicle,
      "Source_Departure":Source_Departure
    }),
  );
  if (response.statusCode == 201) {
    return Logistics.fromJson(json.decode(response.body));
  } else {
    throw Exception('Franchise loading failed!');
  }
}

class Logistics{
  final int Contact_Info;
  final String name;
  final String Parties_Involved;
  final String Cost_Fee;
  final String Transporting_Vehicle;
  final String Source_Departure;

  Logistics(
      {required this.name, required this.Contact_Info, required this.Parties_Involved, required this.Cost_Fee, required this.Transporting_Vehicle, required this.Source_Departure});

  factory Logistics.fromJson(Map<String, dynamic> json) {
    return Logistics(
        name: json["name"],
        Contact_Info: json['Contact_Info'],
        Parties_Involved: json["Parties_Involved"],
        Cost_Fee: json["Cost_Fee"],
        Transporting_Vehicle: json["Transporting_Vehicle"],
        Source_Departure: json["Source_Departure"]
    );
  }
}
