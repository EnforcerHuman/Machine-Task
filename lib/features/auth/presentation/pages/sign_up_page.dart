import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_listing/core/constants/spacing.dart';
import 'package:movies_listing/features/auth/domain/entities/user.dart';
import 'package:movies_listing/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:movies_listing/features/auth/presentation/pages/login_page.dart';
import 'package:movies_listing/features/auth/presentation/widgets/auth_form.dart';
import 'package:movies_listing/features/auth/presentation/widgets/auth_selection_text.dart';
import 'package:movies_listing/features/auth/presentation/widgets/custom_button.dart';

import '../bloc/auth_bloc/auth_event.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  String? _profession;
  final List<String> _professions = [
    'flutter developer',
    'node.js developer',
    'python developer',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('You have successfully created new account')));
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()));
            }
          },
          builder: (context, state) {
            return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Spacing.height48,
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Spacing.height20,
                      AuthForm(
                          nameController: _nameController,
                          emailController: _emailController,
                          passwordController: _passwordController,
                          phoneController: _phoneController,
                          profession: _profession,
                          formKey: _formKey,
                          professions: _professions,
                          onProfessionChanged: (profession) {}),
                      Spacing.height20,
                      CustomButton(
                        buttonText: 'Sign Up',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final user = User(
                                name: _nameController.text.trim(),
                                email: _emailController.text.trim(),
                                phoneNumber: _phoneController.text.trim(),
                                password: _passwordController.text.trim(),
                                profession: _profession ?? '');
                            context.read<AuthBloc>().add(SignupRequested(
                                  user: user,
                                ));
                          }
                        },
                      ),
                      Spacing.height12,
                      const AuthChooseText()
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
