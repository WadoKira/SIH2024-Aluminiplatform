import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenCard extends StatelessWidget {
  final String? sloganText, descriptionText, buttonText, imageUrl;
  final VoidCallback? onTap;
  final Color? color;

  const HomeScreenCard({
    Key? key,
    this.imageUrl,
    this.sloganText,
    this.descriptionText,
    this.buttonText,
    this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? Colors.black, // Default to black if color is not provided
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6.0,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
              child: Image.network(
                imageUrl!,
                width: double.infinity,
                height: 200.0,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sloganText!,
                    style: GoogleFonts.roboto(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber.shade700, // Gold theme
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    descriptionText!,
                    style: GoogleFonts.roboto(
                      fontSize: 16.0,
                      color: Colors.white, // White text for readability on a dark background
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber.shade700, // Gold button
                  onPrimary: Colors.black, // Black text on the button
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Text(
                  buttonText!,
                  style: GoogleFonts.roboto(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Black text
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
