import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

class MovieService {
  final String apiKey = '14a1d21f1428b44468709c4b888044cf'; // For testing purposes only, secure your API key for production
  final Set<int> recentlyRecommended = {}; // Tracks movie IDs to avoid repetition
  final int recommendationHistoryLimit = 10; // Limit for tracking history to avoid repetition

  Future<Map<String, dynamic>?> fetchRandomMovie({List<int>? genreIds}) async {
    // Base URL for fetching popular movies. Adjust as needed for other criteria.
    String baseUrl = 'https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&language=en-US&sort_by=popularity.desc';
    
    if (genreIds != null && genreIds.isNotEmpty) {
      baseUrl += '&with_genres=${genreIds.join(",")}';
    }

    try {
      // Fetch the total number of pages available to ensure a wide selection
      final initialResponse = await http.get(Uri.parse(baseUrl));
      if (initialResponse.statusCode == 200) {
        final totalPages = json.decode(initialResponse.body)['total_pages'];
        // Use a safe cap for the totalPages to avoid exceeding API limits
        final int safeTotalPages = min(totalPages, 500); // Assuming 500 as a safe upper limit
        final randomPage = Random().nextInt(safeTotalPages) + 1; // +1 because page indexing starts at 1
        final randomPageUrl = "$baseUrl&page=$randomPage";

        final response = await http.get(Uri.parse(randomPageUrl));
        if (response.statusCode == 200) {
          final body = json.decode(response.body);
          final List<dynamic> results = body['results'].where((movie) => !recentlyRecommended.contains(movie['id'])).toList();
          
          if (results.isNotEmpty) {
            final randomIndex = Random().nextInt(results.length);
            final randomMovie = results[randomIndex];
            
            // Update recently recommended movies to avoid repetition
            updateRecentlyRecommended(randomMovie['id']);

            return randomMovie as Map<String, dynamic>;
          } else {
            print("No new movies to recommend based on the given filters and random page.");
          }
        } else {
          print("Failed to fetch movies from page $randomPage: ${response.statusCode}");
        }
      }
    } catch (e) {
      print('Error fetching movie: $e');
    }
    return null;
  }

  void updateRecentlyRecommended(int movieId) {
    recentlyRecommended.add(movieId);
    // Maintain the set size to avoid endless growth
    if (recentlyRecommended.length > recommendationHistoryLimit) {
      recentlyRecommended.remove(recentlyRecommended.first);
    }
  }
}
