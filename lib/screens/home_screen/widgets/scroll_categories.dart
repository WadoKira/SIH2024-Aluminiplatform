import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScrollableCategories extends StatelessWidget {
  final List<String?> categories;
  final List<String?> categoriesImgList;
  final List<Widget?> widget;

  const ScrollableCategories({
    Key? key,
    required this.categories,
    required this.categoriesImgList,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size? size = MediaQuery.of(context).size;
    return SizedBox(
      height: 75,
      width: size.width,
      child: Center(
        child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 4,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => widget[index]!,
                    ),
                  );
                },
                child: Container(
                  width: size.width * 0.3, // Adjust the width as needed
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(color: Colors.black54, blurRadius: 0.1),
                    ],
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(2),
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          categoriesImgList[index]!,
                          fit: BoxFit.cover,
                          width: 30,
                          height: 30,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            categories[index]!,
                            style: GoogleFonts.mukta(
                              color: Theme.of(context).secondaryHeaderColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
