import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class JobPostPage extends StatefulWidget {
  @override
  _JobPostPageState createState() => _JobPostPageState();
}

class _JobPostPageState extends State<JobPostPage> {
  final _formKey = GlobalKey<FormState>();
  bool successMessage = false;

  // Form fields
  String jobName = '';
  String companyName = '';
  String jobDescription = '';
  String jobRequirement = '';
  String salary = '';
  String companyWebsite = '';

  Future<void> _saveJobPost() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? jobList = prefs.getString('jobList');
    List<dynamic> jobArray = jobList != null ? json.decode(jobList) : [];

    // Create the new job post object
    final newJob = {
      'jobName': jobName,
      'companyName': companyName,
      'jobDescription': jobDescription,
      'jobRequirement': jobRequirement,
      'salary': salary,
      'companyWebsite': companyWebsite,
    };

    // Add the new job to the existing list
    jobArray.add(newJob);

    // Save the updated list to localStorage
    await prefs.setString('jobList', json.encode(jobArray));

    setState(() {
      successMessage = true;
    });

    // Simulate delay for 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        successMessage = false;
      });
      Navigator.pushNamed(context, '/searchJob'); // Navigate to SearchJobPage
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post a Job'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: successMessage
            ? Center(
          child: Text(
            '✔ Job submitted successfully!',
            style: TextStyle(fontSize: 20, color: Colors.green),
          ),
        )
            : Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextFormField(
                label: 'Job Name',
                onSaved: (value) => jobName = value!,
              ),
              SizedBox(height: 16),
              _buildTextFormField(
                label: 'Company Name',
                onSaved: (value) => companyName = value!,
              ),
              SizedBox(height: 16),
              _buildTextFormField(
                label: 'Job Description',
                onSaved: (value) => jobDescription = value!,
                maxLines: 3,
              ),
              SizedBox(height: 16),
              _buildTextFormField(
                label: 'Job Requirements',
                onSaved: (value) => jobRequirement = value!,
                maxLines: 3,
              ),
              SizedBox(height: 16),
              _buildTextFormField(
                label: 'Salary',
                onSaved: (value) => salary = value!,
              ),
              SizedBox(height: 16),
              _buildTextFormField(
                label: 'Company Website',
                onSaved: (value) => companyWebsite = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _saveJobPost();
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber.shade700,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to reduce redundancy in TextFormFields
  Widget _buildTextFormField({
    required String label,
    required FormFieldSetter<String> onSaved,
    int maxLines = 1,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      maxLines: maxLines,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the $label';
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}
