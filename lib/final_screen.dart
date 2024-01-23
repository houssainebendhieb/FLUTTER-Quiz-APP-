import 'package:challenge1/summary_answers.dart';
import 'package:flutter/material.dart';
import 'package:challenge1/data/questions.dart';

class final_screen extends StatelessWidget {
  final List<String> answers;
  final void Function() restartQuiz;
  const final_screen(this.answers, this.restartQuiz, {super.key});

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < answers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': answers[i]
      });
    }

    return summary;
  }

  Widget build(context) {
    final summaryData = getSummaryData();
    final totalQuestion = questions.length;
    final numberCorrectQuestion = summaryData.where(
      (element) {
        return element['correct_answer'] == element['user_answer'];
      },
    ).length;

    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'You answerd $numberCorrectQuestion question out of $totalQuestion  questions Correctly',
                  style: const TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic)),
              const SizedBox(
                height: 30,
              ),
              summaryAnswers(summaryData),
              const SizedBox(
                height: 30,
              ),
              TextButton.icon(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  restartQuiz();
                },
                icon: const Icon(
                  Icons.refresh,
                ),
                label: const Text(
                  'Restart Quiz',
                ),
              ),
            ],
          ),
        ));
  }
}
