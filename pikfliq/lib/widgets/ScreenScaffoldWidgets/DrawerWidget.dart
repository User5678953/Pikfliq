import 'package:flutter/material.dart';
import 'package:pikfliq/widgets/AboutModalWidget.dart';
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, // Center the content
              children: [
                Text(
                  'Pikfliq Settings', // Updated header to 'Pikfliq Settings'
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold, // Make the title bold
                  ),
                ),
                SizedBox(height: 10), // Add some spacing between header and content
              ],
            ),
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
            leading: Icon(Icons.movie),
            title: Text('Watchlist'),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('About'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => const AboutModalWidget(),
              );
            },
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              'Version 1.5 March 2024',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


