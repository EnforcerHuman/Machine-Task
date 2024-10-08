import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_listing/features/auth/presentation/widgets/custom_button.dart';
import 'package:movies_listing/features/movies/data/models/movie_model.dart';
import 'package:movies_listing/features/movies/widgets/movie_card_text.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});
  final MovieModel movie;

  @override
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const Icon(
                      Icons.arrow_drop_up,
                      size: 30,
                      color: Colors.black,
                    ),
                    Text(
                      movie.totalVoted.toString(),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      size: 30,
                      color: Colors.black,
                    ),
                    const MovieCardText(
                      title: 'Votes',
                    ),
                  ],
                ),
                const SizedBox(width: 24),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: movie.poster,
                    width: 70,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      MovieCardText(
                        title: 'Genere: ${movie.genre}',
                      ),
                      MovieCardText(
                        title: 'Director: ${movie.director}',
                      ),
                      MovieCardText(
                        title: 'Starring: ${movie.stars}',
                      ),
                      MovieCardText(
                        title: 'Mins | ${movie.language}',
                      ),
                      Text(
                        '${movie.pageViews} views | voted by ${movie.voting}',
                        style: const TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
            CustomButton(
              height: 35,
              buttonText: 'Watch Trailer',
              onPressed: () {},
              buttonColor: Colors.green,
              textColor: Colors.white,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
