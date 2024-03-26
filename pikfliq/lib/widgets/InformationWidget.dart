import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InformationWidget extends StatelessWidget {
  final String summary;
  final String releaseDate;

  const InformationWidget({
    super.key,
    required this.summary,
    required this.releaseDate,
  });

  @override
Widget build(BuildContext context) {
    // Formatting the release date
    final DateTime parsedDate = DateTime.parse(releaseDate);
    final String formattedDate = DateFormat('MMMM d, y').format(parsedDate);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Release Date: $formattedDate',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 8),
        Container(
          height: 150, // Specify the height to give bounded constraints
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Text(
              summary,
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
    );
  }
}
