import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../screens/FranchisePage/FranchisePage.dart';
import '../../screens/ScrapsPage/WareHousePage.dart';
import '../../screens/home_screen/widgets/home_screen_card.dart';
import '../../screens/home_screen/widgets/search_bar.dart';
import '../../screens/LogisticsPage/ConsumerLogisticsPage.dart';
import '../../screens/ThunderDealsPage/ThunderDealsPage.dart';
import '../../screens/search_screen/search_screen.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../FranchisePage/ConsumerFranchisePage.dart';
import '../ScrapsPage/ConsumerWareHousePage.dart';
import '../curation_screen/curation_screen.dart';
import '../profile_screen/profile_screen.dart';
import 'widgets/scroll_categories.dart';


class ConsumerHomeScreen extends StatelessWidget {
  const ConsumerHomeScreen({Key? key}) : super(key: key);

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
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/home_bg.png'),
          ),
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20), // Add spacing from the top
              ScrollableCategories(
                categories: categories,
                categoriesImgList: categoriesImg,
                widget:  [
                  ThunderDealsPage(),
                  ConsumerFranchisePage(),
                  ConsumerLogisticsPage(),
                  ConsumerWareHousePage(),
                ],
                // Customize the appearance of ScrollableCategories here
                // You can adjust colors, fonts, padding, etc.
              ),

              Container(
                margin: EdgeInsets.only(bottom: 16.0), // Add 1-inch space (adjust as needed)
                child: HomeScreenCard(
                  color: Colors.lightBlueAccent.shade700,
                  imageUrl:
                  "https://affairscloud.com/assets/uploads/2022/07/PM-participates-in-%E2%80%98Udyami-Bharat-programme.jpg",
                  descriptionText: "Know your rights and perks",
                  sloganText: "Udyami Bharat Scheme",
                  buttonText: "click to learn more",
                  onTap: () async {
                    const url = "https://pmmodiyojana.in/udyami-bharat/";
                    if (await canLaunchUrlString(url)) {
                      await launchUrlString(url);
                    } else {
                      throw "Could not launch $url";
                    }
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16.0), // Add 1-inch space (adjust as needed)
                child: HomeScreenCard(
                  color: Colors.lightBlueAccent.shade700,
                  imageUrl:
                  "https://slike-gold.akamaized.net/f7/yg/3hf7ygouk9/custom_thumb1687533151.jpg",
                  descriptionText: "Speech of Prime Minister about MSMEs",
                  sloganText: "Know more about MSME!!!",
                  buttonText: "click to redirect",
                  onTap: () async {
                    const url = "https://www.youtube.com/watch?v=BFH9W1dDK7A";
                    if (await canLaunchUrlString(url)) {
                      await launchUrlString(url);
                    } else {
                      throw "Could not launch $url";
                    }
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16.0),
                child: HomeScreenCard(
                  color: Colors.lightBlueAccent.shade700,
                  imageUrl: "https://compliancecalendar.s3.ap-south-1.amazonaws.com/assets/latestnewsimage/MSME_crop6_thumb.jpg",
                  descriptionText: "",
                  sloganText: "Udyami Bharat Scheme",
                  buttonText: "Click to Register",
                  onTap: () async {
                    const url = "https://udyamregistration.gov.in/Government-India/Ministry-MSME-registration.htm";
                    if (await canLaunchUrlString(url)) {
                      await launchUrlString(url);
                    } else {
                      throw "Could not launch $url";
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<String?> categories = [
  "Hot",
  "Franchise",
  "Logistics",
  'Goodown',
];

List<String?> categoriesImg = [
  "assets/Hot.png",
  "assets/Franchise.png",
  "assets/Logistics.png",
  "assets/Scraps.png",
];
