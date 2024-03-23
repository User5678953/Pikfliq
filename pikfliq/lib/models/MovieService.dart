import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class MovieService {
  final String apiKey = dotenv.env['TMDB_API_KEY'] ?? '';

  Future<Map<String, dynamic>?> fetchRandomMovie() async {
    var url = Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=$apiKey');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final body = json.decode(response.body);
        final List results = body['results'];
        if (results.isNotEmpty) {
          // Randomly select a movie from the results
          final randomMovie = results[0]; // Simplify for example; consider random selection
          return randomMovie;
        }
      }
    } catch (e) {
      print('Error fetching movie: $e');
    }
    return null;
  }
}
