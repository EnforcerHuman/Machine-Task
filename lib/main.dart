import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_listing/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:movies_listing/features/auth/data/models/user_model.dart';
import 'package:movies_listing/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:movies_listing/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:movies_listing/features/auth/presentation/pages/sign_up_page.dart';
import 'package:movies_listing/features/movies/data/data_source/movies_remote_data_source.dart';
import 'package:movies_listing/features/movies/data/repositories/movie_repos_impl.dart';
import 'package:movies_listing/features/movies/presentation/bloc/movie_bloc/movie_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => AuthBloc(
                authRepository: AuthRepositoryImpl(
                    localDataSource: AuthLocalDataSourceImpl()))),
        BlocProvider(
            create: (_) => MovieBloc(
                movieRepository:
                    MovieRepoImpl(MovieRemoteDataSourceImpl(client: Dio())))
              ..add(FetchMovies()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/signup',
        routes: {
          '/signup': (context) => const SignUpScreen(),
        },
      ),
    );
  }
}
