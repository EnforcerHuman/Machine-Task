// import 'package:dartz/dartz.dart';
// import 'package:movies_listing/core/errors/failures.dart';
// import 'package:movies_listing/core/usecase/usecase.dart';
// import 'package:movies_listing/features/movies/data/models/movie_model.dart';
// import 'package:movies_listing/features/movies/domain/entities/movie_params.dart';
// import 'package:movies_listing/features/movies/domain/repository/movie_repository.dart';
// import 'package:movies_listing/features/movies/presentation/home_page.dart';

// class GetMoviesUseCase implements Usecase<List<Movie>, MovieParams> {
//   final MovieRepository repository;

//   GetMoviesUseCase(this.repository);

//   @override
//   Future<Either<Failure, List<MovieModel>?>> call(MovieParams params) async {
//     return await repository.getMovies(params);
//   }
// }
