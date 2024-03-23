import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const BottomNavigationWidget({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        // Changed to "movie" icon to directly relate to movies, making it clear it's about movie recommendations.
        BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Recommend'),

        // Changed to "explore" icon to suggest discovery beyond just geolocation, implying exploration of movie genres or new titles.
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Discover'),

        // Changed to "bookmark" icon as it's more universally recognized for saving content to view later, aligning with the concept of a watchlist.
        BottomNavigationBarItem(icon: Icon(Icons.bookmark_border), label: 'Watchlist'),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: const Color(0xFFCDBE78),
      onTap: onItemSelected,
    );
  }
}