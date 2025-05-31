import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class InformationWidget extends StatelessWidget {
  final String title;
  final String summary;
  final String releaseDate;
  final String backdropPath;
  final VoidCallback onBackButtonPressed;

  const InformationWidget({
    super.key,
    required this.title,
    required this.summary,
    required this.releaseDate,
    required this.backdropPath,
    required this.onBackButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    final DateTime? parsedDate = DateTime.tryParse(releaseDate);
    final String formattedDate = parsedDate != null ? DateFormat('MMMM d, y').format(parsedDate) : 'Unknown release date';
    
    final bool isMobile = MediaQuery.of(context).size.width < 600;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final textTheme = Theme.of(context).textTheme;

    Widget buildTitle() {
      return Text(title, style: textTheme.titleLarge?.copyWith(color: textColor));
    }

    Widget buildImage() {
      return Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            'https://image.tmdb.org/t/p/w500$backdropPath',
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget buildTextContent() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Text('Release Date: $formattedDate', style: textTheme.titleMedium?.copyWith(color: textColor)),
          const SizedBox(height: 20),
          Text(summary, style: textTheme.bodyMedium?.copyWith(color: textColor)),
        ],
      );
    }

    Widget buildBackButton() {
      return isMobile ? Align(
        alignment: Alignment.bottomLeft,
        child: FloatingActionButton(
           elevation: 0,
          backgroundColor: Colors.red,
          onPressed: onBackButtonPressed,
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ) : const SizedBox();
    }

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildTitle(),
            const SizedBox(height: 20),
            buildImage(),
            const SizedBox(height: 20),
            buildTextContent(),
            const SizedBox(height: 20),
            buildBackButton(),
          ],
        ),
      ),
    );
  }
}