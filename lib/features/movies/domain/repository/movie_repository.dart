import 'package:dartz/dartz.dart';
import 'package:movies_listing/core/errors/failures.dart';
import 'package:movies_listing/features/movies/data/models/movie_model.dart';
import 'package:movies_listing/features/movies/domain/entities/movie_params.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieModel>>> getMovies(MovieParams movieparams);
}
