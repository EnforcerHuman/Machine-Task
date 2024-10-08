import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_listing/core/constants/colors.dart';
import 'package:movies_listing/core/constants/spacing.dart';
import 'package:movies_listing/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:movies_listing/features/auth/presentation/bloc/auth_bloc/auth_event.dart';
import 'package:movies_listing/features/auth/presentation/widgets/auth_form.dart';
import 'package:movies_listing/features/auth/presentation/widgets/custom_button.dart';
import 'package:movies_listing/features/auth/presentation/widgets/loading.dart';

import '../auth_selection_text.dart';

class LoginSection extends StatelessWidget {
  LoginSection({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Icon(Icons.layers_outlined,
                          color: AppColors.primary, size: 40),
                      Spacing.height48,
                      const Text(
                        'Log In',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Spacing.height20,
                      AuthForm(
                          isLogin: true,
                          formKey: _formKey,
                          nameController: _nameController,
                          passwordController: _passwordController,
                          onProfessionChanged: (profession) {}),
                      Spacing.height20,
                      CustomButton(
                        buttonText: 'Log In',
                        isLogin: true,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(SignIn(
                                _nameController.text.trim(),
                                _passwordController.text.trim()));
                          }
                        },
                      ),
                      Spacing.height12,
                      const AuthChooseText(
                        isLogin: true,
                      )
                    ],
                  ),
                ),
              ),
            ),
            if (state is AuthLoading) const OverlayLoadingHolder()
          ],
        );
      },
    );
  }
}
