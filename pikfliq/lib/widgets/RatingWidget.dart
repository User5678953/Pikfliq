import 'package:flutter/material.dart';

class RatingBarWidget extends StatelessWidget {
  final double rating; // Rating on a 10-point scale

  const RatingBarWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width / 2; // Use half the screen width
    final double ratingWidthPercentage = (rating / 10) * screenWidth; // Calculate the filled portion width

    return Column(
      children: [
        const SizedBox(height: 8), // Space above the rating bar
        Center(
          child: Stack(
            children: [
              Container(
                width: screenWidth,
                height: 40, // Increased height for prominence
                decoration: BoxDecoration(
                  color: Colors.grey[850], // Dark background color for dark mode
                  borderRadius: BorderRadius.circular(12), // Slightly larger radius for a more pronounced curve
                ),
              ),
              Container(
                width: ratingWidthPercentage,
                height: 40, // Match the increased height
                decoration: BoxDecoration(
                  color: _getRatingColor(rating), // Fill color based on the rating
                  borderRadius: BorderRadius.circular(12), // Consistent border radius with the background
                ),
                alignment: Alignment.center, // Center the text within the filled bar
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0), // Ensure text doesn't touch the edges
                  child: FittedBox(
                    fit: BoxFit.scaleDown, // Ensures the text scales down to fit the space if needed
                    child: Text(
                      rating.toStringAsFixed(1),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20, // Increased font size
                        color: Colors.white, // Text color for contrast
                      ),
                      maxLines: 1, // Prevents the text from wrapping to a new line
                      overflow: TextOverflow.visible, // Avoids clipping if text overflows
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16), // Increased space below the rating bar for separation
      ],
    );
  }

  Color _getRatingColor(double rating) {
    // Color logic remains the same
    if (rating >= 7) {
      return Colors.greenAccent[400]!; // Bright green for high ratings
    } else if (rating >= 4) {
      return Colors.orange; // Orange for medium ratings
    } else {
      return Colors.redAccent[400]!; // Bright red for low ratings
    }
  }
}
