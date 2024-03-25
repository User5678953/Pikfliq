import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final double voteAverage; // Ranges from 0 to 10

  const RatingWidget({Key? key, required this.voteAverage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Map the vote average (0-10) to a 0-5 scale for star display.
    double rating = voteAverage / 2; // Convert voteAverage to a scale of 0 to 5

    // Calculate the number of filled stars and whether there's a half star
    int filledStars = rating.floor(); // Number of full stars
    bool hasHalfStar = rating - filledStars >= 0.5; // Check if there is a half star

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        if (index < filledStars) {
          // Full star
          return Icon(Icons.star, size: 48, color: Colors.amber); // Larger size
        } else if (index == filledStars && hasHalfStar) {
          // Half star
          return Icon(Icons.star_half, size: 48, color: Colors.amber); // Larger size
        } else {
          // Empty star with light gray outline
          return Icon(Icons.star_border, size: 48, color: const Color.fromARGB(255, 150, 146, 146)); // Larger size
        }
      }),
    );
  }
}
