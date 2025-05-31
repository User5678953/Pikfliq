import 'package:flutter/material.dart';

class UnderDevPlaceholderWidget extends StatefulWidget {
  const UnderDevPlaceholderWidget({super.key});

  @override
  State<UnderDevPlaceholderWidget> createState() => _UnderDevPlaceholderWidgetState();
}

class _UnderDevPlaceholderWidgetState extends State<UnderDevPlaceholderWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 1)), // Simulate a 2-second loading delay
      builder: (context, snapshot) {
        // Check if the future is complete
        if (snapshot.connectionState == ConnectionState.done) {
          // Once the delay is over, show the under development message and icon
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Under Development',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 20),
                Icon(
                  Icons.construction,
                  size: 48,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ],
            ),
          );
        } else {
          // While waiting for the future to complete, show a loading indicator
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
