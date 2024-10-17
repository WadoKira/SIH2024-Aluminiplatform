import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedbackSurveyPage extends StatelessWidget {
  final List<Map<String, String>> surveys = [
    {
      'title': 'Feedback Survey 1',
      'url': 'https://forms.gle/BnjYgfUxokeE5pDE7',
      'imagePath': 'assets/2.jpg',
      'description': 'Provide feedback for our service in this survey.'
    },
    {
      'title': 'Survey for Alumni Engagement',
      'url': 'https://forms.gle/UfdXdAN2FsgUUEcg9',
      'imagePath': 'assets/2.jpg',
      'description': 'Help us improve alumni engagement through this survey.'
    },
    {
      'title': 'Event Feedback Survey',
      'url': 'https://forms.gle/hThVyoDKQ3WX2vRc8',
      'imagePath': 'assets/2.jpg',
      'description': 'Share your thoughts on our recent events.'
    },
    {
      'title': 'Student Experience Survey',
      'url': 'https://forms.gle/ugMt9BvmnGTxTX6g6',
      'imagePath': 'assets/2.jpg',
      'description': 'Let us know how we can enhance the student experience.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback & Survey'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: surveys.length,
        itemBuilder: (context, index) {
          final survey = surveys[index];
          return GestureDetector(
            onTap: () async {
              final url = survey['url']!;
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: Card(
              margin: EdgeInsets.only(bottom: 16.0),
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                    child: Image.asset(
                      survey['imagePath']!,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          survey['title']!,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          survey['description']!,
                          style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
