part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthSuccess extends AuthState {}

final class AuthError extends AuthState {}

final class SignInSuccess extends AuthState {}

final class SignInFailed extends AuthState {}

final class SignupSuccess extends AuthState {}

final class SignupFailed extends AuthState {}

final class AuthLoading extends AuthState {}
