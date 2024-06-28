
import 'package:bible_mindset/pages/quizPages/quiz_screen.dart';
import 'package:flutter/material.dart';

import '../index.dart';



class QuizResult extends StatelessWidget {
  final int score;

  const QuizResult({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFF363636),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Votre score est:',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Center(
              child: Text('$score/10',
                  style: const TextStyle(color: Colors.white, fontSize: 60)),
            ),
            const SizedBox(height: 30,),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(
                top: 20,
              ),
              // color: Color(0XFF162430),
              height: 50,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0XFF162430)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)))),
                child: const Text("Rejouer"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const QuizScreen()));
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(
                top: 20,
              ),
              // color: Color(0XFF162430),
              height: 50,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0XFF162430)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)))),
                child: const Text("Retour"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const AccueilApp()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}