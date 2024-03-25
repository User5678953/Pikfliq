import 'package:flutter/material.dart';
import 'package:pikfliq/models/MovieService.dart';
import 'package:pikfliq/widgets/movie_card.dart';

class MovieFetcherWidget extends StatefulWidget {
  const MovieFetcherWidget({Key? key}) : super(key: key);

  @override
  _MovieFetcherWidgetState createState() => _MovieFetcherWidgetState();
}

class _MovieFetcherWidgetState extends State<MovieFetcherWidget> {
  Map<String, dynamic>? currentMovie;
  final MovieService movieService = MovieService();

  @override
  void initState() {
    super.initState();
    _fetchRandomMovie();
  }

  void _fetchRandomMovie() async {
    try {
      final movie = await movieService.fetchRandomMovie();
      setState(() {
        currentMovie = movie;
      });
    } catch (e) {
      print('Error fetching movie: $e');
    }
  }

  void _swipeLeft() {
    _fetchRandomMovie();
  }

  void _swipeRight() {
    _fetchRandomMovie();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      floatingActionButton: isMobile
          ? FloatingActionButton(
              onPressed: _fetchRandomMovie,
              child: const Icon(Icons.refresh),
            )
          : null,
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.velocity.pixelsPerSecond.dx > 0) {
            _swipeRight();
          } else {
            _swipeLeft();
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (currentMovie != null)
                MovieCard(
                  movieData: currentMovie!,
                  isMobile: isMobile,
                  onFetchMovie: _fetchRandomMovie,
                ),
              if (!isMobile)
                ElevatedButton(
                  onPressed: _fetchRandomMovie,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // This will set the button color to red
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text('Pick-a-Movie'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}