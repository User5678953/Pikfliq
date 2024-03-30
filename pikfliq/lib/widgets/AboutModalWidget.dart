import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutModalWidget extends StatelessWidget {
  const AboutModalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width > 600 ? 400 : MediaQuery.of(context).size.width * 0.75;

    return Dialog(
      backgroundColor: Colors.grey[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        width: size,
        height: size,
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.close, color: Colors.red),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              Center(
                child: Image.asset(
                  'assets/Base430x320_webby_webdev_graphic.png',
                  width: size * 0.5,
                  height: size * 0.375,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Developed by: WebbyWebDev",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Why Pikfliq? Pick-A-Flick was too boring",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Created out of my own frustration with spending hours deciding what to watch, Pikfliq is your shortcut to movie discovery. No more endless browsing through lists without making a decision. With Pikfliq, find your next watch in a click.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () async {
                  const url = 'https://github.com/User5678953';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Could not launch $url'), backgroundColor: Colors.red),
                    );
                  }
                },
                child: Text(
                  "Discover More on GitHub",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue[300],
                    decoration: TextDecoration.underline,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
