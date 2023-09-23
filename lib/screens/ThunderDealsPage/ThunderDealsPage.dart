import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common/search_bar.dart';
import '../../screens/ThunderDealsPage/api/quick_buy_api.dart';
import '../../screens/ThunderDealsPage/widget/info_card.dart';
import '../../screens/search_screen/search_screen.dart';

import '../order_history_screen/api/order_history_api.dart';
import '../order_history_screen/widgets/order_history_card.dart';
import '../profile_screen/profile_screen.dart';

class ThunderDealsPage extends StatefulWidget {
  const ThunderDealsPage({Key? key}) : super(key: key);

  @override
  State<ThunderDealsPage> createState() => _ThunderDealsPage();
}

class _ThunderDealsPage extends State<ThunderDealsPage> {
  @override
  Widget build(BuildContext context) {
    Size? size = MediaQuery.of(context).size;
    Color? color = const Color(0xFFC5CAE9);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC5CAE9),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Thunder Deals',
              style: GoogleFonts.montserrat(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: const Icon(
                    Icons.account_circle,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Image.asset(
            "assets/logo.png",
            height: 40,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              child: const SearchBar(),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SearchPage(),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 20),
              child: AutoSizeText(
                'Recommended for you',
                style: GoogleFonts.montserrat(
                  color: Theme.of(context).secondaryHeaderColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.start,
              ),
            ),

              FutureBuilder(
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

          ],
        ),
      ),
    );
  }
}
