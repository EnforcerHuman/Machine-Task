// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import 'package:movies_listing/features/auth/data/data_sources/auth_local_data_source.dart';
// import 'package:movies_listing/features/auth/data/repositories/auth_repo_impl.dart';
// import 'package:movies_listing/features/auth/domain/repositories/auth_repository.dart';
// import 'package:movies_listing/features/auth/domain/usecases/login_use_case.dart';
// import 'package:movies_listing/features/auth/domain/usecases/sign_up_use_case.dart';
// import 'package:movies_listing/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// final sl = GetIt.instance;

// Future<void> init() async {
//   // Blocs
//   sl.registerFactory(() => AuthBloc(
//         loginUseCase: sl(),
//       ));
//   // sl.registerFactory(() => MovieBloc(getMoviesUseCase: sl()));

//   // Use cases
//   sl.registerLazySingleton(() => LoginUseCase(authRepository: sl()));
//   sl.registerLazySingleton(() => SignUpUseCase(repository: sl()));
//   // sl.registerLazySingleton(() => GetMoviesUseCase(sl()));

//   // Repositories
//   sl.registerLazySingleton<AuthRepository>(
//     () => AuthRepositoryImpl(
//       remoteDataSource: sl(),
//       localDataSource: sl(),
//     ),
//   );
//   // sl.registerLazySingleton<MovieRepository>(
//   //   () => MovieRepositoryImpl(remoteDataSource: sl()),
//   // );

//   // Data sources
//   sl.registerLazySingleton<AuthLocalDataSource>(
//     () => AuthLocalDataSourceImpl(),
//   );

//   // sl.registerLazySingleton<MovieRemoteDataSource>(
//   //   () => MovieRemoteDataSourceImpl(client: sl()),
//   // );

//   // External
//   final sharedPreferences = await SharedPreferences.getInstance();
//   sl.registerLazySingleton(() => sharedPreferences);
//   sl.registerLazySingleton(() => Dio());
// }
