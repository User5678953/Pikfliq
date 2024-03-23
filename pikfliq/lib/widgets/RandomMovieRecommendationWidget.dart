import 'package:flutter/material.dart';
import 'package:pikfliq/models/MovieService.dart';


class MovieFetcherWidget extends StatefulWidget {
  @override
  _MovieFetcherWidgetState createState() => _MovieFetcherWidgetState();
}

class _MovieFetcherWidgetState extends State<MovieFetcherWidget> {
  String movieTitle = "Press 'Fetch' to get a movie";
  final movieService = MovieService();

  void _getRandomMovie() async {
    final movie = await movieService.fetchRandomMovie();
    if (movie != null) {
      setState(() {
        movieTitle = movie['title'] ?? "Unknown title";
      });
    } else {
      setState(() {
        movieTitle = "Failed to fetch movie";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(movieTitle),
        ElevatedButton(
          onPressed: _getRandomMovie,
          child: Text('Fetch'),
        ),
      ],
    );
  }
}
