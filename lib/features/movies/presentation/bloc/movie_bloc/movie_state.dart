part of 'movie_bloc.dart';

sealed class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

final class MovieInitial extends MovieState {}

final class MovieLoaded extends MovieState {
  final List<MovieModel> movies;

  const MovieLoaded(this.movies);
}

final class MovieLoading extends MovieState {}

final class MovieLoadingFailed extends MovieState {
  final String errorMessage;

  const MovieLoadingFailed(this.errorMessage);
}
