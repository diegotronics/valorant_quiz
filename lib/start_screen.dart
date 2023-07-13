import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
          ),
          const SizedBox(height: 80),
          Text(
            'SOMOS VALORANT',
            style: GoogleFonts.lato(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 80),
          ElevatedButton(
            onPressed: startQuiz,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
              backgroundColor: const Color.fromARGB(255, 255, 70, 85),
              foregroundColor: const Color.fromARGB(255, 237, 223, 252),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.zero),
              ),
            ),
            child: const Text(
              'COMENZAR',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
