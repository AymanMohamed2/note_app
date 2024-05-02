import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:note_app/views/notes_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 250,
      backgroundColor: const Color(0xff1B1A1F),
      splash: Lottie.asset('assets/images/animation_images/splash.json'),
      nextScreen: const NotesView(),
    );
  }
}
