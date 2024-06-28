import 'package:bible_mindset/pages/db.dart';
import 'package:bible_mindset/pages/favorite.dart';
import 'package:bible_mindset/pages/quizPages/quiz_screen.dart';
// import 'package:bible_mindset/pages/showQuote.dart';
// import 'package:bible_mindset/pages/versets.dart';
import 'package:flutter/material.dart';
//import 'package:bible/bible.dart';
import 'citations.dart';
import 'drawer.dart';
import 'histoire.dart';
import 'dart:async'; 
import 'dart:math'; 
import 'jesusStory.dart';
import 'listCitations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'notifications.dart';

class AccueilApp extends StatefulWidget {
  const AccueilApp({Key? key}) : super(key: key);

  @override
  State<AccueilApp> createState() => _AccueilAppState();
}

class _AccueilAppState extends State<AccueilApp> {


  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  
Db database = Db();

  int notificationId = 0;
  late int _currentIndex = 0;
  late int _quote = 0;
  late Timer _timer;

  Notifications notificatios = Notifications();
    @override
  void initState() {
    super.initState();
   

    notificatios.initialiseNotifications(flutterLocalNotificationsPlugin);








    // var initializationSettingsAndroid =
    //     AndroidInitializationSettings('app_icon');
    // var initializationSettingsIOS = IOSInitializationSettings();
    // var initializationSettings = InitializationSettings(
    //     android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    // flutterLocalNotificationsPlugin.initialize(initializationSettings);
    
    // Schedule the first notification
    // scheduleNotification();
    // Initialise _currentIndex avec un nombre aléatoire entre 0 et la longueur de la liste moins 1
    _currentIndex = Random().nextInt(quotes.length);
    // Démarre le minuteur pour changer l'élément affiché toutes les minutes
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      setState(() {
        // Change l'élément affiché en choisissant un index aléatoire dans la liste
        _currentIndex = Random().nextInt(quotes.length);
        _quote = Random().nextInt(quotes[_currentIndex]['citations'].length);
      });
    });
  }

  // void onSelectNotification(String payload) async {
  //   if (payload != null) {
  //     debugPrint('notification payload: $payload');
  //   }
  //   // Navigate to the screen you want to show when the user taps on the notification
  // }

   

  @override
  void dispose() {
    // Arrête le minuteur lorsque l'application est fermée
    _timer.cancel();
    super.dispose();
  }

Widget sliderContent() {
  return AnimatedSwitcher(
    duration: const Duration(milliseconds: 500),
    child: Container(
      key: ValueKey<int>(_currentIndex),
      width: double.infinity,
      height: 170,
      margin: const EdgeInsets.only(
        top: 20,
        bottom: 20,
        left: 10,
        right: 10,
      ),
      decoration:  BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("${quotes[_currentIndex]['image']}"),
            fit: BoxFit.cover
          ),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 10,
            child: IconButton(
              onPressed: () async{
                 await database.insert(quotes[_currentIndex]['citations'][_quote]['citation'],quotes[_currentIndex]['citations'][_quote]['verset']);
                setState(() {
                   quotes[_currentIndex]['citations'][_quote]['isFavory'] = !quotes[_currentIndex]['citations'][_quote]['isFavory']!;
                });
                 ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Nouveau favory", style: TextStyle(color: Colors.white,)))
                 );
              }, 
              icon: quotes[_currentIndex]['citations'][_quote]!['isFavory'] ? const Icon(Icons.favorite, color: Colors.white,):
              const Icon(Icons.favorite_border, color: Colors.white,)
              ),
          ),
          Container(
            width: double.infinity,
            height: 95,
            margin: const EdgeInsets.only(top: 40),
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: SingleChildScrollView(
              child: Text(
                      quotes[_currentIndex]['citations'][_quote]['citation'],
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            ),
          ),
          Positioned(
            bottom: 15,
            right: 30,
            child: Text(quotes[_currentIndex]['citations'][_quote]['verset'],style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    ),
  );
}

Widget malistetile(context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 365,
    margin: const EdgeInsets.only(left: 10, right: 10),
    child: Column(
      children: [
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) 
            => const Histoire()));
          },
          child: const Card(
            child: ListTile(
              leading: Icon(Icons.library_books),
              title: Text("Histoires bibliques"),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) 
            => const JesusStory()));
          },
          child: const Card(
            child: ListTile(
              leading: Icon(Icons.question_mark),
              title: Text("Qui est Jésus"),
            ),
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const QuizScreen()));
          },
          child: const Card(
            child: ListTile(
              leading: Icon(Icons.quiz_rounded),
              title: Text("Quiz"),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) 
            => const Citations()));
          },
          child: const Card(
            child: ListTile(
              leading: Icon(Icons.format_quote_sharp),
              title: Text("Citations biblique"),
            ),
          ),
        ),
      ],
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text("Savoir Biblique", style: TextStyle(color: Colors.black),),
        centerTitle: true,
        elevation: 0,
        actions: [Padding(
          padding:const EdgeInsets.only(right: 10),
          child: IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) 
            => const Favory()));
            }, 
            icon: const Icon(Icons.favorite, color: Colors.black,)),
        )],
      ),
      drawer: monDrawer(context),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Column(
              children: [
                sliderContent(),
                SingleChildScrollView(
                  child: malistetile(context),
                ),
                
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                decoration: const BoxDecoration(
                  color: Color(0xFF363636),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      IconButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) 
                            => const Histoire()));
                        }, 
                        icon: const Icon(Icons.library_books, color: Colors.white,)
                      ),
                      IconButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) 
                            => const JesusStory()));
                        }, 
                        icon: const Icon(Icons.question_mark, color: Colors.white,)
                      ),
                      IconButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const QuizScreen()));
                        }, 
                        icon: const Icon(Icons.quiz_rounded, color: Colors.white,)
                      ),
                      IconButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) 
                            => const Citations()));
                        }, 
                        icon: const Icon(Icons.format_quote_sharp, color: Colors.white,)
                      ),
                  ],
                ),
              )
              ),
          ],
        ),
      ),
    );
  }
}




