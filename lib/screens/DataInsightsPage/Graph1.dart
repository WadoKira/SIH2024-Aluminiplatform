import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../layout/nav_layout.dart';
import 'dart:convert';

import 'DataInsightsPage.dart';

// ... (other imports)

class Graph1 extends StatefulWidget {
  const Graph1({Key? key}) : super(key: key);

  @override
  State<Graph1> createState() => _Graph1();
}

class _Graph1 extends State<Graph1> {
  @override
  void initState() {
    getTrendingDataFromVahanDB("https://franchises-api.onrender.com/api/franchise");
    super.initState();
  }

  var franchiseData;
  DioCacheManager _dioCacheManager = DioCacheManager(CacheConfig());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Data Insights",
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color(0xFFC5CAE9),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const NavigationLayout(isConsumer: true),
              ),
            );
          },
        ),
        actions: [
          // Add the button to show the graph here
          IconButton(
            icon: Icon(Icons.show_chart), // You can use a different icon if needed
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DataInsightsPage(title: "Data Insights"),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        width: size.width,
        height: size.height,
        color: const Color(0xFFE7ECFF), // Background color
        child: franchiseData == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: franchiseData.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: size.width * 0.5,
                height: 100, // Adjust the height as needed
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          franchiseData?[index]['Franchise_Name'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "Rs. ${franchiseData?[index]['Investments'].toString()}",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void getTrendingDataFromVahanDB(String? url) async {
    final response = await http.get(Uri.parse(url!));

    setState(() {
      franchiseData = jsonDecode(response.body)['response'];
    });
  }
}
