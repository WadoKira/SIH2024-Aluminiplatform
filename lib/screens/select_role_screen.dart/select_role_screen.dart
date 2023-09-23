import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../layout/nav_layout.dart';
/*
class SelectRoleScreen extends StatelessWidget {
  const SelectRoleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size? size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFC5CAE9),
        body: Center(
          child: Container(
            height: size.height,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 30),
                  child: Container(
                      height: size.height * 0.25,
                      child: Image.asset(
                        "assets/SelectRoles.png",
                        width: 300,
                        height: 300,
                      ),),
                ),
                Text(
                  'Select role',
                  style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: size.height * 0.1,
                  width: size.width * 0.8,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo.shade700,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      onPressed: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) =>
                                const NavigationLayout(isConsumer: true))))
                      },
                      child: Text('Customer',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white)),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: size.height * 0.1,
                  width: size.width * 0.8,
                  child:Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.indigo.shade700, // Background color
                        onPrimary: Colors.white, // Text color
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16), // Button padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // Button border radius
                          // You can add more customizations here, like shadows, elevation, etc.
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const NavigationLayout(isConsumer: false)),
                          ),
                        );
                      },
                      child: Text(
                        'Entrepreneur',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
*/

class SelectRoleScreen extends StatelessWidget {
  const SelectRoleScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFC5CAE9), // Background color
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'We want to know who you are?',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey.shade900,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/SelectRoles.png',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => const NavigationLayout(isConsumer: true)),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo.shade700,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Customer'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => const NavigationLayout(isConsumer: false)),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo.shade700,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Entrepreneur'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
