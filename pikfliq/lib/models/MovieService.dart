//final String apiKey = dotenv.env['TMDB_API_KEY'] ?? '';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

class MovieService {
  final String apiKey = '14a1d21f1428b44468709c4b888044cf'; // Only for testing, remove for production

  Future<Map<String, dynamic>?> fetchRandomMovie() async {
    var url = Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=$apiKey');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final body = json.decode(response.body);
        final List<dynamic> results = body['results'];
        if (results.isNotEmpty) {
          final randomIndex = Random().nextInt(results.length);
          final randomMovie = results[randomIndex];
          
          // Print the entire movie object to the console
          print("Fetched Random Movie: ${json.encode(randomMovie)}");

          return randomMovie as Map<String, dynamic>;
        }
      }
    } catch (e) {
      print('Error fetching movie: $e');
    }
    return null;
  }
}
