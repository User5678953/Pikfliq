import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final Map<String, dynamic> movieData;
  final bool isMobile;

  MovieCard({required this.movieData, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(
            'https://image.tmdb.org/t/p/w500${movieData["poster_path"]}',
            width: isMobile ? MediaQuery.of(context).size.width : 400,
            height: isMobile ? 200 : 400,
            fit: BoxFit.cover,
          ),
          ListTile(
            title: Text(movieData['title'] ?? 'No Title'),
            subtitle: Text(movieData['release_date'] ?? 'No Release Date'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(movieData['overview'] ?? 'No Overview',
                textAlign: TextAlign.justify),
          ),
          if (!isMobile) ...[
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {}, // TODO: Navigate to details screen
                  child: const Text('Details'),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
