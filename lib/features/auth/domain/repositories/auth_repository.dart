import 'package:dartz/dartz.dart';
import 'package:movies_listing/core/errors/failures.dart';
import 'package:movies_listing/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> signup(User user);
  Future<Either<Failure, bool?>> login(String email, String password);
  Future<Either<Failure, bool>> userExists(String name, String password);
}
