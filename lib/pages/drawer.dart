import 'package:flutter/material.dart';

import 'apropo.dart';
import 'citations.dart';
import 'favorite.dart';
import 'histoire.dart';
import 'jesusStory.dart';
import 'quizPages/quiz_screen.dart';

Widget monDrawer(BuildContext context) {
  return Drawer(
    backgroundColor: Colors.white,
    child: ListView(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 300,
          color: const Color(0xFF363636),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 150,
                height: 150,
                margin: const EdgeInsets.only(left: 20, bottom: 10),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(75)),
                    color: Colors.green),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Savoir Biblique",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ],
          ),
        ),
        ListTile(
            leading: const Icon(Icons.library_books),
            title: const Text("Histoires Biblique"),
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(pageBuilder: (_, __, ___) => Histoire()),
              );
            }),
        ListTile(
          leading: const Icon(Icons.question_mark),
          title: Text("Qui est Jésus"),
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(pageBuilder: (_, __, ___) => JesusStory()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.quiz_rounded),
          title: Text("Quiz"),
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(pageBuilder: (_, __, ___) => QuizScreen()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.format_quote_sharp),
          title: Text("Citations"),
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(pageBuilder: (_, __, ___) => Citations()),
            );
          },
        ),
        
        ListTile(
          leading: const Icon(Icons.favorite_border),
          title: Text("Favory"),
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(pageBuilder: (_, __, ___) => Favory()),
            );
          },
        ),
        const Divider(color: Color(0xFF919191), height: 10, thickness: 2, indent: 10,endIndent: 10,),
        ListTile(
          leading: const Icon(Icons.interests_rounded),
          title: Text("A propos"),
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(pageBuilder: (_, __, ___) => Apropo()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.shop_sharp),
          title: Text("Rate us"),
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(pageBuilder: (_, __, ___) => Favory()),
            );
          },
        ),
      ],
    ),
  );
}
