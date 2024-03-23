// HomeScreen.dart
import 'package:flutter/material.dart';
import 'package:pikfliq/themes/Pikfliq_theme_data.dart';
import 'package:pikfliq/widgets/RandomMovieRecommendationWidget.dart';
import 'package:pikfliq/widgets/ScreenScaffoldWidgets/AppBarWidget.dart';
import 'package:pikfliq/widgets/ScreenScaffoldWidgets/BottomNavigationWidget.dart';
import 'package:pikfliq/widgets/ScreenScaffoldWidgets/DrawerWidget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: PikfliqThemeData.lightTheme,
      darkTheme: PikfliqThemeData.darkTheme,
      themeMode: _themeMode,
      home: Scaffold(
        appBar: AppBarWidget(),
        drawer: CustomDrawerWidget(onThemeToggle: _toggleTheme),
        body: IndexedStack(
          index: _selectedIndex,
          children: <Widget>[
            MovieFetcherWidget(), // Use MovieFetcherWidget here
            Center(child: Text('Discover')), // Placeholder for Discover screen content
            Center(child: Text('Watchlist')), // Placeholder for Watchlist screen content
          ],
        ),
        bottomNavigationBar: BottomNavigationWidget(
          selectedIndex: _selectedIndex,
          onItemSelected: _onItemTapped,
        ),
      ),
    );
  }
}