import 'package:movies_listing/features/movies/domain/entities/movie_params.dart';

class MovieParamsModel extends MovieParams {
  MovieParamsModel({
    required String category,
    required String language,
    required String genre,
    required String sort,
  }) : super(
          category: category,
          language: language,
          genre: genre,
          sort: sort,
        );

  // Factory constructor to create MovieParamsModel from JSON
  factory MovieParamsModel.fromJson(Map<String, dynamic> json) {
    return MovieParamsModel(
      category: json['category'],
      language: json['language'],
      genre: json['genre'],
      sort: json['sort'],
    );
  }

  // Method to convert MovieParamsModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'language': language,
      'genre': genre,
      'sort': sort,
    };
  }
}
