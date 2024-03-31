import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawerWidget extends StatefulWidget {
  const CustomDrawerWidget({Key? key}) : super(key: key);

  @override
  _CustomDrawerWidgetState createState() => _CustomDrawerWidgetState();
}

class _CustomDrawerWidgetState extends State<CustomDrawerWidget> {
  bool _includeAdultContent = false; // Default to not including adult content

  @override
  void initState() {
    super.initState();
    _loadAdultContentPreference();
  }

  Future<void> _loadAdultContentPreference() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _includeAdultContent = prefs.getBool('includeAdultContent') ?? false;
    });
  }

  Future<void> _updateAdultContentPreference(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('includeAdultContent', value);
    setState(() {
      _includeAdultContent = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              'Pikfliq Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.movie),
            title: Text('Movies'),
            onTap: () {
              // Your navigation logic here
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Your navigation logic here
            },
          ),
          SwitchListTile(
            title: Text(
              '"R" Rated Content',
              style: TextStyle(color: Colors.grey[600]),
            ),
            subtitle: Text(
              _includeAdultContent ? "Enabled" : "Disabled",
              style: TextStyle(color: _includeAdultContent ? Colors.green : Colors.red),
            ),
            value: _includeAdultContent,
            activeColor: Colors.green,
            inactiveThumbColor: Colors.red,
            onChanged: (bool value) {
              _updateAdultContentPreference(value);
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('About'),
            onTap: () {
              // Your navigation logic here
            },
          ),
        ],
      ),
    );
  }
}
