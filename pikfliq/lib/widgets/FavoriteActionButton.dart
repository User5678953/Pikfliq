import 'package:flutter/material.dart';
import 'package:pikfliq/models/favorites.dart';

class FavoriteActionButton extends StatelessWidget {
  final Map<String, dynamic> movieData;
  final VoidCallback onAddedToFavorites;

  const FavoriteActionButton({
    Key? key,
    required this.movieData,
    required this.onAddedToFavorites,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: true,
      child: Icon(Icons.favorite_border, color: Colors.white),
      backgroundColor: Colors.red,
      onPressed: () {
        favoriteMovies.add(movieData);
        onAddedToFavorites();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Added to Favorites!'),
            backgroundColor: Colors.green,
          ),
        );
      },
    );
  }
}
