import 'package:flutter/material.dart';

import 'package:movies_listing/features/movies/widgets/home_screen.dart/custom_app_bar.dart';
import 'package:movies_listing/features/movies/widgets/home_screen.dart/movie_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: CustomAppBar(), body: MovieList());
  }
}
