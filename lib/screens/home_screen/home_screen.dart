import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexabyte/screens/FranchisePage/FranchisePage.dart';
import 'package:hexabyte/screens/GoodsPage/GoodsPage.dart';
import 'package:hexabyte/screens/ScrapsPage/ScrapsPage.dart';
import 'package:hexabyte/screens/home_screen/widgets/home_screen_card.dart';
import 'package:hexabyte/screens/home_screen/widgets/search_bar.dart';
import 'package:hexabyte/screens/order_history_screen/order_history_screen.dart';
import 'package:hexabyte/screens/LogisticsPage/LogisticsPage.dart';
import 'package:hexabyte/screens/quick_buy_screen/quick_buy_screen.dart';
import 'package:hexabyte/screens/search_screen/search_screen.dart';
import '../curation_screen/curation_screen.dart';
import '../profile_screen/profile_screen.dart';
import 'widgets/scroll_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size? size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFC5CAE9),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFC5CAE9),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    "assets/logo.png",
                    height: 42,
                  ),
                  Text(
                    'Intersect',
                    style: GoogleFonts.roboto(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: const Icon(
                          Icons.account_circle,
                          color: Colors.black,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                child: const SearchBar(),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SearchPage(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: size.height,
        decoration:
            const BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/home_bg.png'))),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              ScrollableCategories(
                categories: categories,
                categoriesImgList: categoriesImg,
                widget: const [ FranchisePage(),LogisticsPage(), ScrapsPage(),GoodsPage()],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<String?> categories = [
  //"Hot",
  "Franchise",
  "Logistics",
  'Scraps',
  'Goods',
];

List<String?> categoriesImg = [
  //"assets/Hot.png",
  "assets/Franchise.png",
  "assets/Logistics.png",
  "assets/Scraps.png",
  "assets/Goods.png",
];
