import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/common/widgets/buttons/basic_app_button.dart';
import 'package:spotify_clone/core/config/assets/app_vectors.dart';
import 'package:spotify_clone/presentation/auth/pages/signin.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      bottomNavigationBar: _signInText(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerText(),
            const SizedBox(height: 50),
            _fullNameField(context),
            const SizedBox(height: 30),
            _emailField(context),
            const SizedBox(height: 30),
            _passwordField(context),
            const SizedBox(height: 30),
            BasicAppButton(onPressed: () {}, title: 'Create Account'),
          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      'Register',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );
  }

  Widget _fullNameField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Full Name',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Enter Email',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Password',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _signInText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Do you have an account? ',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          TextButton(
            child: const Text(
              'Sign In.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SigninPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
