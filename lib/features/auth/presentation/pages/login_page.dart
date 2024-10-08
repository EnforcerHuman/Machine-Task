import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_listing/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:movies_listing/features/auth/presentation/widgets/login_page/login_section.dart';
import 'package:movies_listing/features/movies/presentation/pages/home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SignInSuccess) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (ctx) => const HomePage()),
              (Route<dynamic> route) => false, // Removes all previous routes
            );
          }
          if (state is SignInFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Invalid credentials')));
          }
        },
        child: LoginSection());
  }
}
