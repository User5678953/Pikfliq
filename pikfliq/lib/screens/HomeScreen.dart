import 'package:flutter/material.dart';

import 'package:pikfliq/models/MovieService.dart';
import 'package:pikfliq/widgets/RandomMovieFetcher.dart';
import 'package:pikfliq/widgets/ScreenScaffoldWidgets/AppBarWidget.dart';
import 'package:pikfliq/widgets/ScreenScaffoldWidgets/BottomNavigationWidget.dart';
import 'package:pikfliq/widgets/ScreenScaffoldWidgets/DrawerWidget.dart';
import 'package:pikfliq/widgets/UnderDevPlaceholderWidget.dart';
import 'package:pikfliq/widgets/WatchListWidget.dart';
import 'package:pikfliq/models/favorites.dart'; // This should be your Favorites manager

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.themeMode, required this.toggleTheme}) : super(key: key);

  final ThemeMode themeMode;
  final VoidCallback toggleTheme;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  Map<String, dynamic>? currentMovie;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final MovieService movieService = MovieService();

  @override
  void initState() {
    super.initState();
    fetchRandomMovie();
  }

 void fetchRandomMovie() async {
  final movie = await movieService.fetchRandomMovie();
  if (movie != null) {
    setState(() => currentMovie = movie); // This triggers the rebuild with a new movie.
  }
}

  void _addToFavorites(Map<String, dynamic>? movie) {
    if (movie != null) {
      favoriteMovies.add(movie);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(child: Text(
            '${movie['title']} added to Watchlist!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), // Make text bold white
          )),
          backgroundColor: Colors.green, // Set the snackbar color to green for success
        ),
      );
    }
  }

  @override Widget build(BuildContext context) {
    
  List<Widget> _widgetOptions = [
  RandomMovieFetcher(
    movieData: currentMovie, // Ensure RandomMovieFetcher accepts and uses this parameter
    onNewMovie: (movie) => setState(() => currentMovie = movie)
  ),
  UnderDevPlaceholderWidget(),
  WatchListWidget(),
];

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarWidget(onToggleTheme: widget.toggleTheme, scaffoldKey: _scaffoldKey),
      endDrawer: CustomDrawerWidget(),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(child: _widgetOptions.elementAt(_selectedIndex)),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationWidget(selectedIndex: _selectedIndex, onItemSelected: (index) => setState(() => _selectedIndex = index)),
      floatingActionButton: _selectedIndex == 0 
        ? Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () => _addToFavorites(currentMovie),
                child: const Icon(Icons.favorite),
                backgroundColor: Colors.red,
                heroTag: 'add_to_favorites',
              ),
              SizedBox(height: 10), // Provide some spacing between the buttons
FloatingActionButton(
  onPressed: fetchRandomMovie, // This should trigger the fetch and update the UI
  child: const Icon(Icons.refresh),
  backgroundColor: Colors.blue,
),
            ],
          ) 
        : null,
    );
  }
}

