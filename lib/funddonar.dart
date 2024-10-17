import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import '../../layout/nav_layout.dart';
import 'home_page.dart';

class DonateFundPage extends StatefulWidget {
  const DonateFundPage({Key? key}) : super(key: key);

  @override
  _DonateFundPageState createState() => _DonateFundPageState();
}

class _DonateFundPageState extends State<DonateFundPage> {
  var donateFundData;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Donate Funds",
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
                builder: (context) => HomePage(),
              ),
            );
          },
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        color: const Color(0xFFE7ECFF), // Background color
        child: donateFundData == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: donateFundData.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: size.width * 0.5,
                height: size.height * 0.2, // Adjust the height as needed
                child: GestureDetector(
                  onTap: () {
                    // Handle onTap action
                  },
                  child: Card(
                    elevation: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFC5CAE9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: size.height * 0.2, // Adjust the height as needed
                            width: size.width * 0.4, // Adjust the width as needed
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://pngtree.com/freepng/donation-box-and-charity-concept_8902949.html"), // Placeholder image for donate funds
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    donateFundData?[index]['donor_name'],
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    donateFundData![index]['donation_description'].toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Rs. ${donateFundData?[index]['donation_amount'].toString()}",
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
                        ],
                      ),
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

  @override
  void initState() {
    super.initState();
    getDonateFundDataFromAPI("https://fundraiser-zocy.onrender.com/api/fundraiser");
  }

  void getDonateFundDataFromAPI(String url) async {
    final response = await http.get(Uri.parse(url));

    setState(() {
      donateFundData = jsonDecode(response.body)['response'];
    });
  }
}
