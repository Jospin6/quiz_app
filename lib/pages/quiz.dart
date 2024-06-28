import 'package:flutter/material.dart';
import 'quizPages/quiz_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Center(
                child: Text(
              "QUIZ",
              style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            )),
            const SizedBox(
              height: 450,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context, PageRouteBuilder(
                      pageBuilder: (_,__,___)=> const QuizScreen()
                      )
                    );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF374045),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Center(
                  child: Text(
                    "JOUER",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ))
          ],
        ),
      )),
    );
  }
}
