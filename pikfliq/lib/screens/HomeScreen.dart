import 'package:flutter/material.dart';
import 'package:pikfliq/screens/FavoritesWatchlistScreen.dart'; // Import FavoritesWatchlistScreen
import 'package:pikfliq/widgets/RandomMovieFetcher.dart';
import 'package:pikfliq/widgets/ScreenScaffoldWidgets/AppBarWidget.dart';
import 'package:pikfliq/widgets/ScreenScaffoldWidgets/BottomNavigationWidget.dart';
import 'package:pikfliq/widgets/ScreenScaffoldWidgets/DrawerWidget.dart';
import 'package:pikfliq/widgets/UnderDevPlaceHolderWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {Key? key, required this.themeMode, required this.toggleTheme})
      : super(key: key);

  final ThemeMode themeMode;
  final VoidCallback toggleTheme;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Define your widgets for each tab here
  final List<Widget> _widgetOptions = [
    MovieFetcherWidget(), // Recommend tab content
    UnderDevPlaceholderWidget(), // Discover tab content
    UnderDevPlaceholderWidget(), // Watchlist tab content, under development
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Additional actions based on the index can be placed here if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarWidget(
        onToggleTheme: widget.toggleTheme,
        scaffoldKey: _scaffoldKey,
      ),
      endDrawer: CustomDrawerWidget(), // Your custom drawer widget
      // The body changes based on the current index
body: LayoutBuilder(
  builder: (BuildContext context, BoxConstraints constraints) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: constraints.maxHeight),
        child: IntrinsicHeight(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
    );
  },
),
      bottomNavigationBar: BottomNavigationWidget(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }
}
