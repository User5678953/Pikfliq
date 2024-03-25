import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> movieData;

  const MovieDetailsScreen({super.key, required this.movieData});

  @override
  Widget build(BuildContext context) {
    // TODO: Implement the UI based on movieData
    return Scaffold(
      appBar: AppBar(
        title: Text(movieData['title'] ?? 'Movie Details'),
      ),
      body: const Center(
        child: Text('Details Screen Placeholder'),
      ),
    );
  }
}
