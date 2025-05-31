import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutModalWidget extends StatelessWidget {
  const AboutModalWidget({super.key});

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
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ),
              Center(
                child: Image.asset(
                  'assets/Base430x320_webby_webdev_graphic.png',
                  width: size * 0.5,
                  height: size * 0.375,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Pikfliq - Your Shortcut to Movie Discovery",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Pikfliq is designed to simplify your movie choices. Say goodbye to endless scrolling and indecision. With Pikfliq, discover your next favorite movie in just one click.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () async {
                  const url = 'https://github.com/User5678953';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Could not launch $url'), backgroundColor: Colors.red),
                    );
                  }
                },
                child: Text(
                  "WebbyWebDev on GitHub",
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
