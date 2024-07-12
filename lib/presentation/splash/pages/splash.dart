import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/core/config/assets/app_vectors.dart';
import 'package:spotify_clone/presentation/intro/pages/get_started.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          AppVectors.logo,
        ),
      ),
    );
  }

  Future<void> redirect() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const GetStarted(),
      ),
    );
  }
}
