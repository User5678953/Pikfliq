import 'package:flutter/material.dart';
import 'package:pikfliq/widgets/ActionButtonWidget.dart';
import 'package:pikfliq/widgets/InformationWidget.dart';
import 'package:pikfliq/widgets/PosterWidget.dart';
import 'package:pikfliq/widgets/RatingWidget.dart';
import 'package:pikfliq/widgets/TitleWidget.dart';
import 'dart:math' as math;

class MovieCard extends StatefulWidget {
  final Map<String, dynamic>? movieData;
  final bool isMobile;
  final VoidCallback onFetchMovie;

  const MovieCard({
    Key? key,
    required this.movieData,
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
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
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

  @override
  Widget build(BuildContext context) {
    if (widget.movieData == null) {
      return Center(child: CircularProgressIndicator());
    }

    return Stack(
      children: [
        widget.isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
        // Positioned(
        //   bottom: 20,
        //   right: 20,
        //   child: FloatingActionButton(
        //     onPressed: widget.onFetchMovie,
        //     child: const Icon(Icons.refresh),
        //   ),
        // ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    // Mobile layout with flip animation
    return GestureDetector(
      onTap: _flipCard,
      child: AnimatedBuilder(
        animation: _flipAnimation,
        builder: (context, child) {
          final isFront = _isFront();
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // Add perspective
              ..rotateY(_flipAnimation.value * math.pi),
            child: isFront
                ? child
                : Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..rotateY(math.pi),
                    child: InformationWidget(
                      summary: widget.movieData!['overview'] ?? '',
                      releaseDate: widget.movieData!['release_date'] ?? '',
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
    // Desktop layout splits screen into two columns
    return Row(
      children: [
        // Left half of the screen: Title, Poster, and Rating
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TitleWidget(title: widget.movieData!['title'] ?? 'No Title'),
              PosterWidget(imagePath: widget.movieData!['poster_path'] ?? ''),
              RatingBarWidget(
                  rating: widget.movieData!['vote_average'].toDouble()),
            ],
          ),
        ),
        // Right half of the screen: Information
        Expanded(
          child: InformationWidget(
            summary: widget.movieData!['overview'] ?? '',
            releaseDate: widget.movieData!['release_date'] ?? '',
          ),
        ),
      ],
    );
  }
}
