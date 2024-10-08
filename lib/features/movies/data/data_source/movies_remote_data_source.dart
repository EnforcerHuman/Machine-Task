import 'package:dio/dio.dart';
import '../models/movie_model.dart';

/// Abstract class defining the contract for remote movie data source.
abstract class MovieRemoteDataSource {
  /// Fetches a list of movies based on the provided parameters.
  Future<List<MovieModel>> getMovies({
    required String language, // Language for the movie list
    required String genre, // Genre for the movie list
    required String sort, // Sorting order for the movie list
  });
}

/// Implementation of MovieRemoteDataSource using Dio for network requests.
class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final Dio client; // Dio client for making HTTP requests

  MovieRemoteDataSourceImpl({required this.client});

  /// Retrieves a list of movies from the remote source.
  @override
  Future<List<MovieModel>> getMovies({
    required String language,
    required String genre,
    required String sort,
  }) async {
    try {
      // Prepare the request body with required parameters
      final Map<String, dynamic> requestBody = {
        'category': 'movies',
        'language': language,
        'genre': genre,
        'sort': sort,
      };

      // Make a POST request to fetch the movie list
      final response = await client.post(
        'https://hoblist.com/api/movieList',
        data: requestBody,
        options: Options(
          headers: {
            'Content-Type': 'application/json', // Set content type to JSON
          },
        ),
      );

      // Check if the response status code is 200 (OK)
      if (response.statusCode == 200) {
        final List<dynamic> movieList = response.data['result'] ?? [];
        // Map the movieList directly to List<MovieModel>
        List<MovieModel> movies = movieList
            .map((movieJson) => MovieModel.fromJson(movieJson))
            .toList();

        return movies; // Return the list of MovieModel objects
      } else {
        // Throw an exception for non-200 status codes
        throw Exception(
            'Failed to fetch movies. Status code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      // Catch network errors
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      // Catch any other errors
      throw Exception('Failed to fetch movies: ${e.toString()}');
    }
  }
}
