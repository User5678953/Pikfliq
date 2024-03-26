import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  
  const TitleWidget({super.key, required this.title});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center, // Center the text container
      padding: const EdgeInsets.symmetric(horizontal: 8.0), // Add some padding to avoid text touching the edges
      child: FittedBox(
        fit: BoxFit.scaleDown, // Scale down the text to fit within the available space
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 30, // Starting font size, but FittedBox will adjust it as needed
            fontWeight: FontWeight.bold,
          ),
          softWrap: false, // Prevent wrapping to a new line
          overflow: TextOverflow.ellipsis, // Add ellipsis for overly long titles that still overflow
        ),
      ),
    );
  }
}
