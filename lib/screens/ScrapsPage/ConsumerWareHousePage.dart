import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../layout/nav_layout.dart';
import '../../screens/order_history_screen/api/order_history_api.dart';
import '../../screens/order_history_screen/widgets/order_history_card.dart';

class ConsumerWareHousePage extends StatefulWidget {
  const ConsumerWareHousePage({Key? key}) : super(key: key);

  @override
  State<ConsumerWareHousePage> createState() => _ConsumerWareHousePage();
}

class _ConsumerWareHousePage extends State<ConsumerWareHousePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Warehouse",
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
      ),
      body: Container(
        width: size.width,
        height: size.height,
        color: const Color(0xFFE7ECFF), // Background color
        child: warehouseData == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: warehouseData.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: size.width * 0.5,
                height: size.height * 0.2, // Adjust the height as needed
                child: GestureDetector(
                  onTap: () {},
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
                                  "https://www.assureshift.in/sites/default/files/images/blog/benefits-of-packers-and-movers-warehouse-facility.jpg",
                                ),
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
                                    warehouseData?[index]['Name'],
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20, // Adjust the font size as needed
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    warehouseData![index]['Overview'].toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                     warehouseData![index]['Rental_Terms'].toString(),
                                    textAlign: TextAlign.start,
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
    getTrendingDataFromVahanDB("https://warehouse-api-gk8h.onrender.com/api/Warehouse");
  }

  var warehouseData;
  DioCacheManager _dioCacheManager = DioCacheManager(CacheConfig());

  void getTrendingDataFromVahanDB(String? url) async {
    final response = await http.get(Uri.parse(url!));

    setState(() {
      warehouseData = jsonDecode(response.body)['response'];
    });
  }
}
