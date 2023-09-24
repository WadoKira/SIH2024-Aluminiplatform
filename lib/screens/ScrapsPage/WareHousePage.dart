import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import '../../layout/nav_layout.dart';
import '../../screens/order_history_screen/api/order_history_api.dart';
import '../../screens/order_history_screen/widgets/order_history_card.dart';
import 'package:flutter/material.dart';

class WareHousePage extends StatefulWidget {
  @override
  _WareHousePage createState() => _WareHousePage();
}

class _WareHousePage extends State<WareHousePage> {
  // Variables to store user input
  String name = '';
  String overview = '';
  String typeOfWasteGood = '';
  String pricing = '';
  String qualityQuantity = '';

  // Form key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WareHouse Page'),
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
                decoration: InputDecoration(labelText: 'Overview'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an overview';
                  }
                  return null;
                },
                onSaved: (value) {
                  overview = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Type of Waste/Good'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter type of waste/good';
                  }
                  return null;
                },
                onSaved: (value) {
                  typeOfWasteGood = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Pricing'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter pricing';
                  }
                  return null;
                },
                onSaved: (value) {
                  pricing = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Quality/Quantity'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter quality/quantity';
                  }
                  return null;
                },
                onSaved: (value) {
                  qualityQuantity = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Use the values stored in variables (name, overview, etc.)
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
                              Text('Overview: $overview'),
                              Text('Type of Waste/Good: $typeOfWasteGood'),
                              Text('Pricing: $pricing'),
                              Text('Quality/Quantity: $qualityQuantity'),
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
