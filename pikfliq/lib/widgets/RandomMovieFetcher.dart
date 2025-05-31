import 'package:flutter/material.dart';
import 'package:pikfliq/models/MovieService.dart';
import 'package:pikfliq/widgets/movie_card.dart';

class RandomMovieFetcher extends StatefulWidget {
  final Map<String, dynamic>? movieData;

  const RandomMovieFetcher({super.key, required this.onNewMovie, this.movieData});
  final Function(Map<String, dynamic>?) onNewMovie;

  @override
  _RandomMovieFetcherState createState() => _RandomMovieFetcherState();

  static _RandomMovieFetcherState? of(BuildContext context) =>
      context.findAncestorStateOfType<_RandomMovieFetcherState>();
}

class _RandomMovieFetcherState extends State<RandomMovieFetcher> {
  Map<String, dynamic>? currentMovie;
  final MovieService movieService = MovieService();

  @override
  void initState() {
    super.initState();
    fetchRandomMovie();
  }

  void fetchRandomMovie() async {
    final movie = await movieService.fetchRandomMovie();
    if (movie != null && mounted) {
      // Check if the widget is still in the widget tree
      setState(() => currentMovie = movie);
      widget.onNewMovie(movie); // Call the callback with the new movie data
    }
  }

  @override
  Widget build(BuildContext context) {
    return currentMovie != null
        ? MovieCard(
            key: ValueKey(
                currentMovie!['id']), // Assuming each movie has a unique 'id'
             movieData: widget.movieData, // Passed down from HomeScreen
    isMobile: MediaQuery.of(context).size.width < 600,
    onFetchMovie: () {}, 
          )
        : const Center(
            child:
                CircularProgressIndicator()); // Ensure this line is correct as shown
  }
}
