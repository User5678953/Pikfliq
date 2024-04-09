import 'package:flutter/material.dart';
import 'package:pikfliq/models/favorites.dart'; // Import the favorites list

class WatchListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watch List'),
      ),
      body: favoriteMovies.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('You haven\'t added any movies yet'),
                  SizedBox(height: 20), // Adding space between text and button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home'); // Changed button text and route
                    },
                    child: Text('Browse Movies'), // Changed button text
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: favoriteMovies.length,
              itemBuilder: (context, index) {
                var movie = favoriteMovies[index];
                return Dismissible(
                  key: Key(movie['id'].toString()), // Assuming each movie has a unique 'id'
                  background: Container(
                    color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  onDismissed: (direction) {
                    // Remove movie from favorites list and shared preferences
                    favoriteMovies.removeAt(index);
                    // Call function to update shared preferences here
                  },
                  child: Card(
                    elevation: 4,
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(movie['title'] ?? 'No Title'),
                      onTap: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      trailing: Icon(Icons.delete_sweep_rounded), // Swipe icon indicator
                    ),
                  ),
                );
              },
            ),
    );
  }
}
