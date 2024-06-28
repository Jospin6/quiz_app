import 'package:flutter/material.dart';

class QuizQuestion extends StatelessWidget {
  final String question;
  final List<Map<String, dynamic>> answers;
  final Function answerQuestion;
  final int timeLeft;
  final int score;

  const QuizQuestion(
      {super.key,
      required this.question,
      required this.answers,
      required this.answerQuestion,
      required this.timeLeft,
      required this.score});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 300,
          decoration: const BoxDecoration(
            color: Color(0xFF363636),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "$score/10",
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  progresse(),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 10),
                child: Center(
                  child: Text(
                    question,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
        ...answers.map((answer) => QuizAnswer(
              text: answer['text'],
              score: answer['score'],
              answerQuestion: answerQuestion,
            )),
      ],
    );
  }

  Padding progresse() {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
            width: 150,
            height: 10,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(50),
            ),
            child: LayoutBuilder(
                builder: (context, BoxConstraints constraints) => Container(
                      width: constraints.maxWidth * 0.5,
                      color: Colors.white,
                    ))));
  }
}

class QuizAnswer extends StatelessWidget {
  final String text;
  final int score;
  final Function answerQuestion;

  const QuizAnswer(
      {super.key,
      required this.text,
      required this.score,
      required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(
        top: 20,
        left: 10,
        right: 10,
      ),
      // color: Color(0XFF162430),
      height: 50,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xFF0D0D0D)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)))),
        child: Text(text),
        onPressed: () => answerQuestion(score),
      ),
    );
  }
}
