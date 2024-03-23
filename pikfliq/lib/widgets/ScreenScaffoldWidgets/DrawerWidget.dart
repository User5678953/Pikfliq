import 'package:flutter/material.dart';

class CustomDrawerWidget extends StatelessWidget {
  final Function(ThemeMode) onThemeToggle;

  const CustomDrawerWidget({
    Key? key,
    required this.onThemeToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine if the current theme is light or dark
    final isLightTheme = Theme.of(context).brightness == Brightness.light;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
            onTap: () {
              // Implement navigation to profile page or functionality
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(isLightTheme ? Icons.nightlight_round : Icons.wb_sunny),
            title: Text('Toggle Theme'),
            onTap: () {
              // Toggle the theme mode when this option is selected
              onThemeToggle(isLightTheme ? ThemeMode.dark : ThemeMode.light);

              Navigator.pop(context); // Optionally close the drawer
            },
          ),
          // Add more list tiles for other drawer items as needed
        ],
      ),
    );
  }
}
