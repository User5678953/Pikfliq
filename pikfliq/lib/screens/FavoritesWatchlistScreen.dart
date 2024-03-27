import 'package:flutter/material.dart';
import 'package:pikfliq/screens/FavoritesWatchlistScreen.dart';
import 'package:pikfliq/widgets/ScreenScaffoldWidgets/AppBarWidget.dart';
import 'package:pikfliq/widgets/ScreenScaffoldWidgets/BottomNavigationWidget.dart';
import 'package:pikfliq/widgets/ScreenScaffoldWidgets/DrawerWidget.dart';
import 'package:pikfliq/widgets/UnderDevPlaceholderWidget.dart';

class FavoritesWatchlistScreen extends StatefulWidget {
  const FavoritesWatchlistScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesWatchlistScreen> createState() => _FavoritesWatchlistScreenState();
}

class _FavoritesWatchlistScreenState extends State<FavoritesWatchlistScreen> {
  int _selectedIndex = 2; // Assuming "Watchlist" is the third item

  // Create a global key to manage the ScaffoldState, needed for the AppBarWidget
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Here, you would handle screen navigation or content changes based on the bottom nav selection
    });
  }

  void _toggleTheme() {
    // Placeholder for theme toggle logic
    // This could be expanded to actually toggle between light/dark themes if you're managing theme data at an app-wide level
    print("Theme toggled"); // For demonstration
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Use the _scaffoldKey for Scaffold
      appBar: AppBarWidget(
        onToggleTheme: _toggleTheme,
        scaffoldKey: _scaffoldKey,
      ),
      drawer: CustomDrawerWidget(), // Assuming the DrawerWidget doesn't need additional parameters
      body: Center(
        child: UnderDevPlaceholderWidget(), // Display the under development placeholder
      ),
      bottomNavigationBar: BottomNavigationWidget(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }
}
