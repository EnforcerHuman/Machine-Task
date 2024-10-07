import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_listing/features/auth/domain/repositories/auth_repository.dart';
import 'package:movies_listing/features/auth/presentation/bloc/auth_bloc/auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<SignupRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final result = await authRepository.signup(event.user);
        result.fold(
          (failure) {
            emit(SignupFailed());
            print('Signup failed: ${failure.message}');
          },
          (user) {
            emit(AuthSuccess());
            print('User signed up successfully:');
          },
        );
      } catch (e) {
        emit(SignupFailed());
        print('Unexpected error during signup: $e');
      }
    });

    on<SignIn>((event, emit) async {
      emit(AuthLoading());
      final result = await authRepository.login(event.email, event.password);
      result.fold(
        (failure) {
          emit(SignInFailed());
          print('Login failed: ${failure.message}');
        },
        (userExists) {
          if (userExists == true) {
            print('User exists');
            emit(SignInSuccess());
          } else {
            print('User does not exist');
            emit(SignInFailed());
          }
        },
      );
    });
  }
}
