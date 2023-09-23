import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../screens/consumer_active_orders_screen/api/consumer_active_order_api.dart';
import '../../screens/consumer_active_orders_screen/widgets/consumer_active_order_card.dart';
import '../order_history_screen/widgets/order_history_card.dart';
import '../order_history_screen/api/order_history_api.dart';
class DataInsightsPage extends StatefulWidget {
  const DataInsightsPage({Key? key}) : super(key: key);

  @override
  State<DataInsightsPage> createState() => _DataInsightsPage();
}

class _DataInsightsPage extends State<DataInsightsPage> {
  List data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC5CAE9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFC5CAE9),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Data Insights',
              style: GoogleFonts.montserrat(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: OrderHistoryApi.getMyOrders(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            print(snapshot.data);
            final response = (snapshot.data as List<dynamic>?);
            if (response == null) {
              return const Center(child: Text('Nothing found'));
            }
            if (response.isEmpty) {
              return const Center(child: Text('Nothing found'));
            }

            final reversed = response.reversed.toList();

            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Container(
                color: Colors.white,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: reversed.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => OrderHistoryCard(
                    id: reversed[index]['item_id']['\$oid'],
                    name: reversed[index]['food_waste_title'] ?? 'Vegetable peels',
                    price: reversed[index]['cost'] * response[index]['subscribed_qty'] ?? 200,
                    subscriptedQty: reversed[index]['subscribed_qty'] ?? 50,
                    duration: reversed[index]['duration'] ?? 1,
                    status: reversed[index]['status'],
                    isOneTime: reversed[index]['one_time'] ?? true,
                  ),
                ),
              ),
            );
          }
          return const Center(child: Text('Loading...'));
        }),
      ),
    );
  }
}
