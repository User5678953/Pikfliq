import 'package:flutter/material.dart';
import 'package:pikfliq/widgets/ActionButtonWidget.dart';
import 'package:pikfliq/widgets/InformationWidget.dart';
import 'package:pikfliq/widgets/PosterWidget.dart';
import 'package:pikfliq/widgets/RatingWidget.dart';
import 'package:pikfliq/widgets/SearchBarWidget.dart';
import 'package:pikfliq/widgets/TitleWidget.dart';

class MovieCard extends StatelessWidget {
  final Map<String, dynamic> movieData;
  final bool isMobile;
  final VoidCallback onFetchMovie; 

  const MovieCard({
    Key? key, 
    required this.movieData, 
    this.isMobile = false, 
    required this.onFetchMovie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
        child: Column(
          children: [
            TitleWidget(title: movieData['title'] ?? 'No Title'),
            PosterWidget(imagePath: movieData['poster_path'] ?? ''),
            RatingBarWidget(rating: movieData['vote_average'].toDouble()), // Adjust as per your rating logic
            InformationWidget(
  releaseDate: movieData['release_date'],
  summary: movieData['overview'],
),
            if (!isMobile) ActionButtonWidget(onFetchMovie: onFetchMovie),
            if (!isMobile) const SearchBarWidget(),
            // ... Add any other widgets or information you need
          ],
        ),
      ),
    );
  }
}
