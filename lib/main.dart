import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_listing/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:movies_listing/features/auth/data/models/user_model.dart';
import 'package:movies_listing/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:movies_listing/features/auth/domain/usecases/login_use_case.dart';
import 'package:movies_listing/features/auth/domain/usecases/sign_up_use_case.dart';
import 'package:movies_listing/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:movies_listing/features/auth/presentation/pages/sign_up_page.dart';

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
        // BlocProvider(create: (_) => sl<MovieBloc>()),
      ],
      child: MaterialApp(
        title: 'Movie App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/signup',
        routes: {
          '/signup': (context) => const SignUpScreen(),
          // '/login': (context) => LoginPage(),
          // '/movies': (context) => MovieListPage(),
        },
      ),
    );
  }
}
