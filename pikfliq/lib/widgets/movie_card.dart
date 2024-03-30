import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:pikfliq/widgets/ActionButtonWidget.dart';
import 'package:pikfliq/widgets/InformationWidget.dart';
import 'package:pikfliq/widgets/PosterWidget.dart';
import 'package:pikfliq/widgets/RatingWidget.dart';
import 'package:pikfliq/widgets/TitleWidget.dart';
import 'package:pikfliq/widgets/ScreenScaffoldWidgets/ErrorSnackbar.dart'; // Make sure this path is correct

class MovieCard extends StatefulWidget {
  final Map<String, dynamic>? movieData;
  final bool isMobile;
  final VoidCallback onFetchMovie;

  const MovieCard({
    Key? key,
    this.movieData,
    this.isMobile = false,
    required this.onFetchMovie,
  }) : super(key: key);

  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _flipAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    _flipAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _isFront() => _flipAnimation.value < 0.5;

  void _flipCard() {
    if (widget.isMobile) {
      if (_isFront()) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  void _showError() {
    ErrorSnackBarWidget.show(context, 'An error has occurred!');
  }

  @override
  Widget build(BuildContext context) {
    if (widget.movieData == null) {
      return Center(child: CircularProgressIndicator());
    }

    return widget.isMobile ? _buildMobileLayout() : _buildDesktopLayout();
  }

  Widget _buildMobileLayout() {
    // Implementation for mobile layout

    return GestureDetector(
      onTap: _flipCard,
      child: AnimatedBuilder(
        animation: _flipAnimation,
        builder: (context, child) {
          final isFront = _isFront();
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(_flipAnimation.value * math.pi),
            child: isFront
                ? child
                : Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..rotateY(math.pi),
                    child: InformationWidget(
                      summary: widget.movieData!['overview'] ??
                          'No Overview Available',
                      releaseDate: widget.movieData!['release_date'] ??
                          'No Release Date',
                    ),
                  ),
          );
        },
        child: Column(
          children: [
            TitleWidget(title: widget.movieData!['title'] ?? 'No Title'),
            PosterWidget(imagePath: widget.movieData!['poster_path'] ?? ''),
            RatingBarWidget(
                rating: widget.movieData!['vote_average'].toDouble()),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    double posterHeight = 400; // Define a fixed height for your poster widget
    double ratingBarWidth = 200; // Define a desired width for your rating bar

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleWidget(title: widget.movieData!['title'] ?? 'No Title'),
              SizedBox(
                height: posterHeight,
                child: PosterWidget(
                    imagePath: widget.movieData!['poster_path'] ?? ''),
              ),
              SizedBox(height: 8),
              Center(
                // Center the rating bar horizontally within the column
                child: Container(
                  width: ratingBarWidth, // Set the width for your rating bar
                  child: RatingBarWidget(
                      rating: widget.movieData!['vote_average'].toDouble()),
                ),
              ),
              SizedBox(
                  height: 16), // Optional space for the action button if needed
              ActionButtonWidget(onFetchMovie: widget.onFetchMovie),
            ],
          ),
        ),
        VerticalDivider(width: 1, color: Colors.grey),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: InformationWidget(
              summary: widget.movieData!['overview'] ?? '',
              releaseDate: widget.movieData!['release_date'] ?? '',
            ),
          ),
        ),
      ],
    );
  }
}
