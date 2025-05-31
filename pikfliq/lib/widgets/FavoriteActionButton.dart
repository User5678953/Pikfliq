import 'package:flutter/material.dart';
import 'package:pikfliq/models/favorites.dart';

class FavoriteActionButton extends StatelessWidget {
  final Map<String, dynamic> movieData;
  final VoidCallback onAddedToFavorites;

  const FavoriteActionButton({
    super.key,
    required this.movieData,
    required this.onAddedToFavorites,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: true,
      backgroundColor: Colors.red,
      onPressed: () {
        favoriteMovies.add(movieData);
        onAddedToFavorites();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Added to Favorites!'),
            backgroundColor: Colors.green,
          ),
        );
      },
      child: Icon(Icons.favorite_border, color: Colors.white),
    );
  }
}
