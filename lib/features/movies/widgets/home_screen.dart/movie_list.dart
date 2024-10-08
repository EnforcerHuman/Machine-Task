import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_listing/features/movies/presentation/bloc/movie_bloc/movie_bloc.dart';
import 'package:movies_listing/features/movies/widgets/movie_card.dart';
import 'package:movies_listing/features/movies/widgets/movie_card_shimmer.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is MovieLoading) {
          return const MovieCardShimmer();
        } else if (state is MovieLoaded) {
          return ListView.builder(
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                return MovieCard(movie: state.movies[index]);
              });
        } else if (state is MovieLoadingFailed) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return const Center(
            child: Text('Unexpected error'),
          );
        }
      },
    ));
  }
}
