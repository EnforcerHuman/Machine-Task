import 'package:dartz/dartz.dart';
import 'package:movies_listing/core/errors/failures.dart';
import 'package:movies_listing/features/auth/domain/entities/user.dart';

abstract interface class Usecase<SuccessType, Params> {
  Future<Either<Failure, SuccessType?>> call({required Params params});
}

class NoParams {}

class SignUpParams extends NoParams {
  final User user;
  final String additionalParam;

  SignUpParams({
    required this.user,
    required this.additionalParam,
  });
}

class LoginParams extends NoParams {
  final String email;
  final String password;

  LoginParams({
    required this.email,
    required this.password,
  });
}
