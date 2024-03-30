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
      if (mounted) {
        setState(() {
          currentMovie = movie;
        });
      }
    } catch (e) {
      print('Error fetching movie: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchRandomMovie,
        child: const Icon(Icons.refresh),
        backgroundColor: Color.fromARGB(255, 87, 2, 235),
      ),
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          _fetchRandomMovie();
        },
        child: currentMovie != null
            ? LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            MovieCard(
                              movieData: currentMovie!,
                              isMobile: isMobile,
                              onFetchMovie: _fetchRandomMovie,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
