import 'package:bible_mindset/pages/quizPages/question.dart';
import 'package:bible_mindset/pages/quizPages/resultQuiz.dart';
import 'package:flutter/material.dart';
import 'dart:math';
// ignore: duplicate_import
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import '../index.dart';
import 'questionsList.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {








//SELECTION ALEATOIR

  List<Map<String, dynamic>> randomQuestions = [];

  void selectRandomQuestions() {
    final random = Random();
    while (randomQuestions.length < 10) {
      final index = random.nextInt(questions.length);
      if (!randomQuestions.contains(questions[index])) {
        randomQuestions.add(questions[index]);
      }
    }
  }

// Variable pour afficher des reponses et les scores
  int questionIndex = 0;
  int score = 0;
  late Timer _timer;
  int _timeLeft = 10;

  void answerQuestion(int answerScore) {
    setState(() {
      score += answerScore;
      questionIndex++;
      _timeLeft = 10;
      _timer.cancel();
    });
    HapticFeedback.vibrate();
    SystemSound.play(SystemSoundType.click);
    if (questionIndex == randomQuestions.length) {
      // Fin du quiz
      _timer.cancel();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) => QuizResult(
                    score: score,
                  )));
    }
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft > 0) {
          _timeLeft--;
        } else {
          answerQuestion(0);
        }
      });
    });
  }

  // void changetime(){
  //   Timer.periodic(Duration(seconds: 10), (timer) { })
  // }

  @override
  void initState() {
    super.initState();
    selectRandomQuestions();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF363636),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const AccueilApp()));
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        centerTitle: true,
        title: const Text(
          "Quiz Biblique",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                answerQuestion(0);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(const Color(0xFF363636)),
                elevation: MaterialStateProperty.all(0),
              ),
              child: const Text(
                "Passer",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: questionIndex < randomQuestions.length
          ? QuizQuestion(
              question: randomQuestions[questionIndex]['question']!,
              answers: randomQuestions[questionIndex]['answers']!,
              answerQuestion: answerQuestion,
              timeLeft: _timeLeft,
              score: score,
            )
          : QuizResult(score: score),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}



















