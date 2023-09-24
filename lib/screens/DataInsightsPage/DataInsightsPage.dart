import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../layout/nav_layout.dart';
import '../../screens/order_history_screen/api/order_history_api.dart';
import '../../screens/order_history_screen/widgets/order_history_card.dart';

class DataInsightsPage extends StatefulWidget {
  DataInsightsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _DataInsightsPageState createState() => _DataInsightsPageState();
}

class _DataInsightsPageState extends State<DataInsightsPage> {
  late List<GDPData> _chartData;
  var franchiseData;

  @override
  void initState() {
    super.initState();
    _chartData = getChartData();
    getTrendingDataFromVahanDB("https://franchises-api.onrender.com/api/franchise");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            widget.title,
            style: const TextStyle(
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
                  builder: (context) =>
                  const NavigationLayout(isConsumer: false),
                ),
              );
            },
          ),
        ),
        body: SfCartesianChart(
          title: ChartTitle(text: 'Data Insights about Franchises'),
          legend: Legend(isVisible: true),
          tooltipBehavior: TooltipBehavior(enable: true), // Define the tooltip behavior
          series: <ChartSeries>[
            BarSeries<GDPData, String>(
              name: 'GDP',
              dataSource: _chartData,
              xValueMapper: (GDPData gdp, _) => gdp.continent,
              yValueMapper: (GDPData gdp, _) => gdp.gdp,
              dataLabelSettings: DataLabelSettings(isVisible: true),
            ),
          ],
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0),
            title: AxisTitle(text: 'Revenue'),
          ),
        ),
      ),
    );
  }
  List<GDPData> getChartData() {
    final List<GDPData> chartData = [];

    if (franchiseData != null && franchiseData.isNotEmpty) {
      chartData.add(
        GDPData(franchiseData[0]['Franchise_Name'], double.parse(franchiseData[0]['Investments'])),
      );

      if (franchiseData.length > 1) {
        chartData.add(
          GDPData(franchiseData[1]['Franchise_Name'], double.parse(franchiseData[1]['Investments'])),
        );
      }
    }

    chartData.addAll([
      GDPData('Franchise A', 2900),
      GDPData('Franchise B', 230),
      GDPData('Franchise C', 2488),
      GDPData('Franchise D', 3439),
      GDPData('Franchise E',125),
      GDPData('Franchise F',1000)
    ]);

    return chartData;
  }


  void getTrendingDataFromVahanDB(String? url) async {
    final response = await http.get(Uri.parse(url!));

    setState(() {
      franchiseData = jsonDecode(response.body)['response'];
    });
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final double gdp;
}
