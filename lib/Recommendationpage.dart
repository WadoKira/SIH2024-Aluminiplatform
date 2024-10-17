import 'package:flutter/material.dart';

class RecommendationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recommendation'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text('This is the Recommendation Page'),
      ),
    );
  }
}