import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:pikfliq/widgets/ActionButtonWidget.dart';
import 'package:pikfliq/widgets/InformationWidget.dart';
import 'package:pikfliq/widgets/PosterWidget.dart';
import 'package:pikfliq/widgets/RatingWidget.dart';
import 'package:pikfliq/widgets/TitleWidget.dart';



class MovieCard extends StatefulWidget {
  final Map<String, dynamic>? movieData;
  final bool isMobile;
  final VoidCallback onFetchMovie;

  const MovieCard({
    super.key,
    this.movieData,
    this.isMobile = false,
    required this.onFetchMovie,
  });

  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _flipAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _flipAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _isFront => _flipAnimation.value < 0.5;

  void _flipCard() {
    if (widget.isMobile) {
      _controller.isCompleted ? _controller.reverse() : _controller.forward();
    }
  }

Widget _buildMobileLayout() {
  return GestureDetector(
    onTap: _flipCard,
    onHorizontalDragEnd: (DragEndDetails details) {
      // Check the velocity of the drag to determine swipe direction
      if (details.primaryVelocity! > 0) {
        // Swipe Right - might want to flip to the back of the card or perform some action
        if (!_isFront) _flipCard(); // Flip to front if currently at the back
      } else if (details.primaryVelocity! < 0) {
        // Swipe Left - Fetch a new movie and flip to the front of the card if needed
        widget.onFetchMovie(); // Fetch a new movie on swipe left
        if (!_isFront) _flipCard(); // Ensure the card is flipped back to front to show new movie
      }
    },
    child: AnimatedBuilder(
      animation: _flipAnimation,
      builder: (context, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001) // Perspective
            ..rotateY(_flipAnimation.value * math.pi), // Flip animation
          child: _isFront
              ? Stack(
                  children: [
                    Column(
                      children: [
                        TitleWidget(title: widget.movieData!['title'] ?? 'No Title'),
                        PosterWidget(imagePath: widget.movieData!['poster_path'] ?? ''),
                        RatingBarWidget(rating: widget.movieData!['vote_average'].toDouble()),
                      ],
                    ),
                  ],
                )
              : Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..rotateY(math.pi),
                  child: InformationWidget(
                    title: widget.movieData!['title'] ?? 'No Title',
                    summary: widget.movieData!['overview'] ?? 'No Overview Available',
                    releaseDate: widget.movieData!['release_date'] ?? 'No Release Date',
                    backdropPath: widget.movieData!['backdrop_path'] ?? '',
                    onBackButtonPressed: _flipCard,
                  ),
                ),
        );
      },
    ),
  );
}

  Widget _buildDesktopLayout() {
    // Adjustments for desktop layout can be similar, focusing on content structure
    // and alignment as per your design preferences.
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: InformationWidget(
        title: widget.movieData!['title'] ?? 'No Title',
        summary: widget.movieData!['overview'] ?? '',
        releaseDate: widget.movieData!['release_date'] ?? '',
        backdropPath: widget.movieData!['backdrop_path'] ?? '',
        onBackButtonPressed: _flipCard,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.movieData == null
        ? const Center(child: CircularProgressIndicator())
        : widget.isMobile ? _buildMobileLayout() : _buildDesktopLayout();
  }
}

