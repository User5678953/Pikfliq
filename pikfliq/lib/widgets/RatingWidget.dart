import 'package:flutter/material.dart';

class RatingBarWidget extends StatelessWidget {
  final double rating; // Rating on a 10-point scale

  const RatingBarWidget({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Convert rating to a percentage for the bar width
    final double ratingPercentage = (rating / 10) * 100;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100, // Fixed width for the bar container
          height: 20, // Fixed height for a compact appearance
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[300], // Background color of the rating bar
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: ratingPercentage, // Width based on rating percentage
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: _getRatingColor(rating), // Fill color based on rating
              ),
            ),
          ),
        ),
        SizedBox(width: 8), // Spacing between the bar and the rating text
        Text(
          rating.toStringAsFixed(1), // Show the rating value next to the bar
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Color _getRatingColor(double rating) {
    // Determine the fill color of the rating bar based on the rating value
    if (rating >= 7) {
      return Colors.green; // High ratings
    } else if (rating >= 4) {
      return Colors.orange; // Medium ratings
    } else {
      return Colors.red; // Low ratings
    }
  }
}
