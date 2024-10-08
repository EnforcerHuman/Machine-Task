import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_listing/features/movies/data/models/movie_model.dart';
import 'package:movies_listing/features/movies/domain/entities/movie_params.dart';
import 'package:movies_listing/features/movies/domain/repository/movie_repository.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository movieRepository;
  MovieBloc({required this.movieRepository}) : super(MovieInitial()) {
    on<FetchMovies>((event, emit) async {
      // Prepare the movie parameters
      MovieParams movieParams = MovieParams(
        category: 'movies',
        language: 'kannada',
        genre: 'all',
        sort: 'voting',
      );

      emit(MovieLoading());

      // Call the repository and handle the response using fold
      final eitherResult = await movieRepository.getMovies(movieParams);

      eitherResult.fold(
        (failure) {
          // Handle failure case (you can emit an error state)
          emit(MovieLoadingFailed('Failed to fetch movies'));
        },
        (movies) {
          // Handle success case (you can emit the loaded state)
          print(movies.toString());
          emit(MovieLoaded(movies));
        },
      );
    });
  }
}
