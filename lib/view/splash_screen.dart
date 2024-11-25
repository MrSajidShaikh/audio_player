import 'dart:async';

import 'package:flutter/material.dart';
import 'package:music_player_app/view/home_screen.dart';

import '../utils/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      },
    );
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.blueGrey, green],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: NetworkImage(
                    'https://www.technomag.fr/wp-content/uploads/2024/02/Logo-green-musicians-transparant--1024x576.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
