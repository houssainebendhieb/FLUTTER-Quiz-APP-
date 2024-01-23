import 'package:flutter/material.dart';

class questionIdentifier extends StatelessWidget {
  final questionIndex;
  final bool correctAnswer;
  const questionIdentifier(this.questionIndex, this.correctAnswer, {super.key});

  @override
  Widget build(context) {
    return Container(
      height: 30,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: correctAnswer == true ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(100)),
      child: Text((questionIndex + 1).toString(),
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black)),
    );
  }
}
