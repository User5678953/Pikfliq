import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

class MovieService {
  final String apiKey = '14a1d21f1428b44468709c4b888044cf'; // Secure your API key
  final Set<int> recentlyRecommended = {};
  final List<Map<String, dynamic>> recommendationHistory = []; // History of recommendations
  int historyIndex = -1; // Current position in the history
  final int recommendationHistoryLimit = 10; // Limit for the history

  Future<Map<String, dynamic>?> fetchRandomMovie({List<int>? genreIds, bool includeAdult = false}) async {
    String baseUrl = 'https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&language=en-US&sort_by=popularity.desc&include_adult=${includeAdult.toString()}';
    if (genreIds != null && genreIds.isNotEmpty) {
      baseUrl += '&with_genres=${genreIds.join(",")}';
    }

    try {
      final initialResponse = await http.get(Uri.parse(baseUrl));
      if (initialResponse.statusCode == 200) {
        final totalPages = json.decode(initialResponse.body)['total_pages'];
        final int safeTotalPages = min(totalPages, 500);
        final randomPage = Random().nextInt(safeTotalPages) + 1;
        final randomPageUrl = "$baseUrl&page=$randomPage";

        final response = await http.get(Uri.parse(randomPageUrl));
        if (response.statusCode == 200) {
          final body = json.decode(response.body);
          final List<dynamic> results = body['results'].where((movie) => !recentlyRecommended.contains(movie['id'])).toList();

          if (results.isNotEmpty) {
            final randomIndex = Random().nextInt(results.length);
            final randomMovie = results[randomIndex];
            
            updateRecentlyRecommended(randomMovie['id']);
            addToHistory(randomMovie);

            return randomMovie as Map<String, dynamic>;
          }
        }
      }
    } catch (e) {
      print('Error fetching movie: $e');
    }
    return null;
  }

  void updateRecentlyRecommended(int movieId) {
    recentlyRecommended.add(movieId);
    if (recentlyRecommended.length > recommendationHistoryLimit) {
      recentlyRecommended.remove(recentlyRecommended.first);
    }
  }

  void addToHistory(Map<String, dynamic> movie) {
    if (recommendationHistory.length >= recommendationHistoryLimit) {
      // Reset the history if limit is reached
      recommendationHistory.clear();
      historyIndex = -1;
    }
    recommendationHistory.add(movie);
    historyIndex++;
  }

  Map<String, dynamic>? getPreviousRecommendation() {
    if (historyIndex > 0) {
      historyIndex--;
      return recommendationHistory[historyIndex];
    }
    return null;
  }

  Map<String, dynamic>? getNextRecommendation() {
    if (historyIndex < recommendationHistory.length - 1) {
      historyIndex++;
      return recommendationHistory[historyIndex];
    }
    return null;
  }
}

