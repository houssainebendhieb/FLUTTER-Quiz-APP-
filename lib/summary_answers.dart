import 'package:challenge1/question_identifier.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class summaryAnswers extends StatelessWidget {
  const summaryAnswers(this.summary, {super.key});
  final List<Map<String, Object>> summary;

  @override
  Widget build(context) {
    return SizedBox(
      height: 150,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map((e) {
            return Row(
              children: [
                questionIdentifier(((e['question_index'] as int) ),e['correct_answer']==e['user_answer']),
                const SizedBox(width:20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e['question'] as String,
                        textAlign: TextAlign.center,
                        style:GoogleFonts.lato(color:Colors.white,
                        fontSize : 16,
                        fontWeight: FontWeight.bold,
                        )
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(e['correct_answer'] as String,
                          textAlign: TextAlign.left),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(e['user_answer'] as String,
                          textAlign: TextAlign.left),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
