import 'package:flutter/material.dart';

class ErrorSnackBarWidget {
  // Static method to show a snackbar. This allows you to call ErrorSnackBarWidget.show()
  // from anywhere in your app without needing to instantiate the class.
  static void show(BuildContext context, String message, {int duration = 4}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: duration),
        backgroundColor: Colors.redAccent, // Choose a color that indicates an error
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            // This will dismiss the snackbar
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
          textColor: Colors.white,
        ),
      ),
    );
  }
}
