import 'package:dartz/dartz.dart';
import 'package:movies_listing/core/errors/failures.dart';
import 'package:movies_listing/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:movies_listing/features/auth/data/models/user_model.dart';
import 'package:movies_listing/features/auth/domain/entities/user.dart';
import 'package:movies_listing/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, User>> signup(User user) async {
    try {
      final userModel = UserModel(
        password: user.password,
        name: user.name,
        email: user.email,
        phoneNumber: user.phoneNumber,
        profession: user.profession,
      );

      await localDataSource.saveUser(userModel);
      return Right(userModel);
    } catch (e) {
      return Left(ServerFailure('Failed to create user: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, bool>> login(String email, String password) async {
    try {
      UserModel? userModel = await localDataSource.getUser(email, password);
      if (userModel == null) {
        return const Right(false);
      }
      return const Right(true);
    } catch (e) {
      return Left(ServerFailure('Failed to log in: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, bool>> userExists(
      String email, String password) async {
    try {
      bool isUserExist = await localDataSource.isUserExists(email, password);
      return Right(isUserExist);
    } catch (e) {
      return Left(
          ServerFailure('Error checking user existence: ${e.toString()}'));
    }
  }
}
