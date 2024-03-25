import 'package:flutter/material.dart';
import 'package:pikfliq/widgets/RandomMovieFetcher.dart';

import 'package:pikfliq/widgets/ScreenScaffoldWidgets/AppBarWidget.dart';
import 'package:pikfliq/widgets/ScreenScaffoldWidgets/BottomNavigationWidget.dart';
import 'package:pikfliq/widgets/ScreenScaffoldWidgets/DrawerWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.themeMode, required this.toggleTheme})
      : super(key: key);

  final ThemeMode themeMode;
  final VoidCallback toggleTheme;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // Declare scaffoldKey here

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

 @override
  Widget build(BuildContext context) {
    double drawerWidth = MediaQuery.of(context).size.width * 0.5; // Half the screen width

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarWidget(
        onToggleTheme: widget.toggleTheme, 
        scaffoldKey: _scaffoldKey,
      ),
      // Use endDrawer and SizedBox to customize the drawer width
      endDrawer: SizedBox(
        width: drawerWidth,
        child: CustomDrawerWidget(), // Your custom drawer widget
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
          MovieFetcherWidget(),
          Center(child: Text('Discover')),
          Center(child: Text('Watchlist')),
        ],
      ),
      bottomNavigationBar: BottomNavigationWidget(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }
}
