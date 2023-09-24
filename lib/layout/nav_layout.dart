import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexabyte/screens/DataInsightsPage/Graph1.dart';
import '../../screens/DataInsightsPage/DataInsightsPage.dart';
import '../../screens/consumer_active_orders_screen/consumer_active_orders_screen.dart';
import '../../screens/home_screen/home_screen.dart';
import '../../screens/home_screen/ConsumerHome_screen.dart';
import '../../screens/producer_active_order_screen/active_order_screen.dart';


class NavigationLayout extends StatefulWidget {
  final bool isConsumer;
  const NavigationLayout({Key? key, required this.isConsumer}) : super(key: key);

  @override
  NavigationLayoutState createState() => NavigationLayoutState();
}

class NavigationLayoutState extends State<NavigationLayout> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabNavigations = widget.isConsumer
        ? [
      //const ListedProductsScreen(),
      const ConsumerHomeScreen(),
      //const AddProductsScreen(),
      const ConsumerActiveOrdersScreen(),
      //const ProducerOrderHistoryScreen(),
          ]
        : [
      const HomeScreen(),
      const ConsumerActiveOrdersScreen(),
      const Graph1(),
      //const QuickBuyScreen(),
      //const CurationScreen(),
      //const OrderHistoryScreen(),
          ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Text(''),
        backgroundColor: const Color(0xFFC5CAE9),
        toolbarHeight: 0,
      ),
      body: tabNavigations[_currentIndex],
      backgroundColor: Colors.white,
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: const Color(0xFF303F9F),
            labelTextStyle: MaterialStateProperty.all(
              GoogleFonts.montserrat(
                fontSize: 12,
              ),
            )),
        child: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          // backgroundColor: const Color.fromARGB(255, 215, 225, 209),
          backgroundColor: const Color(0xFFC5CAE9),
          destinations: widget.isConsumer
              ? const [
            NavigationDestination(
              icon: FaIcon(
                FontAwesomeIcons.home,
                size: 20,
                color: Colors.black,
              ),
              label: 'Home',
            ),
            //NavigationDestination(icon: Icon(Icons.add, size: 20), label: 'Add Product'),
            NavigationDestination(
              icon: FaIcon(
                FontAwesomeIcons.windowRestore,
                size: 20,
                color: Colors.black,
              ),
              label: 'Active orders',
            ),

          ] :
            const [
                  NavigationDestination(
                    icon: FaIcon(FontAwesomeIcons.home, size: 20),
                    label: "Home",
                  ),
                  //NavigationDestination(icon: FaIcon(FontAwesomeIcons.cartArrowDown, size: 20), label: 'Quick Buy'),
                  // NavigationDestination(icon: Icon(Icons.create, size: 20), label: 'Combo Buy'),
                  NavigationDestination(icon: Icon(Icons.archive_outlined, size: 20), label: 'My orders'),
            NavigationDestination(
              icon: Icon(Icons.auto_graph_outlined, size: 20),
              label: 'Data Insights',
            ),
                ],
        ),
      ),
    );
  }
}
