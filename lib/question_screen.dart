import 'package:challenge1/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:challenge1/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  final void Function(String answer) addAnswer;
  const QuestionScreen(this.addAnswer, {super.key});
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  int i = 0;

  void answerQuestion(String answer) {
    widget.addAnswer(answer);
    setState(() {
      i++;
    });
  }

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[i].text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ...questions[i].answers.map((e) {
              return AnswerButton(e, () {
                answerQuestion(e);
              });
            }),
            /*  AnswerButton(questions[0].text, () {}),
            AnswerButton(questions[1].text, () {}),
            AnswerButton(questions[2].text, () {}),
          */
          ],
        ),
      ),
    );
  }
}
