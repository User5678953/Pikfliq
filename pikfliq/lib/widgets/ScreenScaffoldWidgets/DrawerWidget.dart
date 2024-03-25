import 'package:flutter/material.dart';

class CustomDrawerWidget extends StatefulWidget {
  const CustomDrawerWidget({Key? key}) : super(key: key);

  @override
  _CustomDrawerWidgetState createState() => _CustomDrawerWidgetState();
}

class _CustomDrawerWidgetState extends State<CustomDrawerWidget> {
  void _closeDrawer(BuildContext context) {
    Navigator.of(context).pop(); // Close the drawer
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 80, // Reduced height of the DrawerHeader
            color: Theme.of(context).colorScheme.secondary, // Changed color to a different shade of purple
            child: Center(
              child: Text(
                'Navigation',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22, // Increased font size of the text
                  fontWeight: FontWeight.bold, // Added bold styling
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Profile'),
            onTap: () {
              // Navigate to the profile page (placeholder action)
              _closeDrawer(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Watchlist'),
            onTap: () {
              // Navigate to the watchlist page
              Navigator.pushNamed(context, '/watchlist');
            },
          ),
          // Placeholder for future features
          ListTile(
            leading: const Icon(Icons.explore),
            title: const Text('Explore'),
            onTap: () {
              // Placeholder action for explore
              _closeDrawer(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Navigate to the settings page
              Navigator.pushNamed(context, '/settings');
            },
          ),
          GestureDetector(
            onTap: () => _closeDrawer(context),
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 16.0),
              margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20.0), // Adjust the border radius as needed
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_back,
                  size: 36, // Adjust the size of the arrow
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
