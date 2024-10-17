import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class JobSearchPage extends StatefulWidget {
  @override
  _JobSearchPageState createState() => _JobSearchPageState();
}

class _JobSearchPageState extends State<JobSearchPage> {
  List<dynamic> jobList = [];

  @override
  void initState() {
    super.initState();
    _loadJobList();
  }

  Future<void> _loadJobList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedJobs = prefs.getString('jobList');
    if (storedJobs != null) {
      setState(() {
        jobList = json.decode(storedJobs);
      });
    }
  }

  Future<void> _clearJobs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('jobList');
    setState(() {
      jobList = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Job'),
        backgroundColor: Colors.black,
      ),
      body: jobList.isEmpty
          ? Center(
        child: Text(
          'No job postings available.',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: jobList.length,
                itemBuilder: (context, index) {
                  final job = jobList[index];
                  return Card(
                    margin: EdgeInsets.only(bottom: 16.0),
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            job['jobName'],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text("Company Name: ${job['companyName']}"),
                          SizedBox(height: 8),
                          Text("Job Description: ${job['jobDescription']}"),
                          SizedBox(height: 8),
                          Text("Job Requirements: ${job['jobRequirement']}"),
                          SizedBox(height: 8),
                          Text("Salary: ${job['salary']}"),
                          SizedBox(height: 8),
                          Text(
                            "Company Website: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () async {
                              final url = job['companyWebsite'];
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: Text(
                              job['companyWebsite'],
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _clearJobs,
              child: Text('Clear Jobs'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
