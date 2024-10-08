import 'package:dartz/dartz.dart';
import 'package:movies_listing/features/movies/data/data_source/movies_remote_data_source.dart';
import 'package:movies_listing/features/movies/data/models/movie_model.dart';
import 'package:movies_listing/features/movies/domain/repository/movie_repository.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/movie_params.dart';

class MovieRepoImpl implements MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;

  MovieRepoImpl(this.movieRemoteDataSource);

  @override
  Future<Either<Failure, List<MovieModel>>> getMovies(
      MovieParams movieParams) async {
    // Fixed return type
    try {
      final movies = await movieRemoteDataSource.getMovies(
        language: movieParams.language,
        genre: movieParams.genre,
        sort: movieParams.sort,
      );
      print('****************');
      print('print from repo impl');
      print(movies);
      return Right(movies); // Return the movies list
    } catch (e) {
      print(e.toString());
      return Left(ServerFailure(e.toString()));
    }
  }
}
