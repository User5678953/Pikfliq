import 'package:flutter/material.dart';
import 'package:pikfliq/models/MovieService.dart';
import 'package:pikfliq/widgets/movie_card.dart';

class MovieFetcherWidget extends StatefulWidget {
  @override
  _MovieFetcherWidgetState createState() => _MovieFetcherWidgetState();
}

class _MovieFetcherWidgetState extends State<MovieFetcherWidget> {
  Map<String, dynamic> movieData = {};
  final MovieService movieService = MovieService();

  void _getRandomMovie() async {
    try {
      final movie = await movieService.fetchRandomMovie();
      setState(() {
        movieData = movie ?? {};
      });
    } catch (e) {
      print('Error fetching movie: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return GestureDetector(
      onVerticalDragEnd: (details) {
        // Positive velocity indicates swipe up
        if (details.primaryVelocity != null && details.primaryVelocity! < 0) {
          _getRandomMovie();
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (movieData.isNotEmpty) 
            MovieCard(movieData: movieData, isMobile: isMobile),
          ElevatedButton(
            onPressed: _getRandomMovie,
            child: const Text('Fetch New Movie'),
          ),
        ],
      ),
    );
  }
}
