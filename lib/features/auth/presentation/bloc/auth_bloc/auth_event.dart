import 'package:equatable/equatable.dart';
import 'package:movies_listing/features/auth/domain/entities/user.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

// final class SignUp extends AuthEvent {
//   final User user;

//   const SignUp(this.user);
// }

final class SignIn extends AuthEvent {
  final String email;
  final String password;

  SignIn(this.email, this.password);
}

final class SignOut extends AuthEvent {}

final class SignupRequested extends AuthEvent {
  final User user;

  const SignupRequested({
    required this.user,
  });
}
