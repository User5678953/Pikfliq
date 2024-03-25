import 'package:flutter/material.dart';

class PosterWidget extends StatelessWidget {
  final String imagePath;

  const PosterWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 600;

    // Set the image height
    final double imageHeight;
    if (isMobile) {
      // For mobile, we can take a bit more than half of the screen height
      imageHeight = screenHeight * 0.55;
    } else {
      // For desktop, we use less height since there's usually more vertical space
      imageHeight = screenHeight * 0.45;
    }

    return Center(
      child: Container(
        width: isMobile ? double.infinity : screenWidth * 0.5, // Full width on mobile, half on desktop
        height: imageHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://image.tmdb.org/t/p/w500$imagePath'),
            fit: BoxFit.contain, // Use BoxFit.contain to avoid overflow
          ),
        ),
      ),
    );
  }
}