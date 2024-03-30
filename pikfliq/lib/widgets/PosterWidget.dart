import 'package:flutter/material.dart';

class PosterWidget extends StatelessWidget {
  final String imagePath;

  const PosterWidget({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine an appropriate height based on the screen size
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 600;
    final double imageHeight = screenSize.height * (isMobile ? 0.63 : 0.45); // Adjust the height ratio for mobile and desktop

    // Define width constraints for desktop
    final double maxWidth = isMobile ? screenSize.width : 400.0; // For example, max width of 400 pixels for desktop

    return Center( // Center the image on non-mobile screens
      child: Container(
        height: imageHeight, // Set the height to limit the vertical length
        width: isMobile ? double.infinity : maxWidth, // Limit width for non-mobile screens
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://image.tmdb.org/t/p/w500$imagePath'),
            fit: BoxFit.cover, // Maintain BoxFit.cover as per your design preference
          ),
          borderRadius: isMobile ? BorderRadius.zero : BorderRadius.circular(10), // Optional: Rounded corners for non-mobile
        ),
      ),
    );
  }
}