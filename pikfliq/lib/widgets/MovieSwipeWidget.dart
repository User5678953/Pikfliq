import 'package:flutter/material.dart';
import 'package:pikfliq/widgets/InformationWidget.dart';
import 'package:pikfliq/widgets/RatingWidget.dart';

class MovieSwipeWidget extends StatelessWidget {
  final String moviePoster;
  final String movieDescription;
  final double rating;

  const MovieSwipeWidget({
    super.key,
    required this.moviePoster,
    required this.movieDescription,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Swipeable(
      onSwipeLeft: () {
        // Handle swipe left action
      },
      onSwipeRight: () {
        // Handle swipe right action
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Movie Poster
          Image.network(
            moviePoster,
            fit: BoxFit.cover,
          ),
          // Movie Description and Rating
          Positioned(
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movieDescription,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    RatingWidget(voteAverage: rating),
                    const SizedBox(width: 8.0),
                    InformationWidget(information: '$rating/10'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
