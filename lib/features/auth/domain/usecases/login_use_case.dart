import 'package:dartz/dartz.dart';
import 'package:movies_listing/core/errors/failures.dart';
import 'package:movies_listing/core/usecase/usecase.dart';
import 'package:movies_listing/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase implements Usecase<bool, LoginParams> {
  final AuthRepository repository;

  LoginUseCase({required this.repository});

  @override
  Future<Either<Failure, bool?>> call({required LoginParams params}) async {
    return await repository.login(params.email, params.password);
  }
}
