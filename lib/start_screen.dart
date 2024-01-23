import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  final void Function() startQuiz;
  const StartScreen(this.startQuiz, {super.key});

  @override
  Widget build(context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Image.asset(
        'images/quiz-logo.png',
        width: 300,
      ),
      const SizedBox(height: 35),
      Text('Learn flutter the right way',
      style: GoogleFonts.lato(color:Colors.white)),
      const SizedBox(height: 35),
      OutlinedButton.icon(
          onPressed: () {
            startQuiz();
          },
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text("Let's get started"))
    ]);
  }
}
