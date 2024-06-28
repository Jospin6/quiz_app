import 'package:bible_mindset/pages/bdd.dart';
import 'package:bible_mindset/pages/model.dart';
import 'package:flutter/material.dart';
import 'pages/note_screen.dart';
// import 'pages/essai.dart';
// import 'pages/quiz.dart';
import 'pages/index.dart';

void main() {
  runApp(const BibleMindset());
}


class BibleMindset extends StatelessWidget {
  const BibleMindset({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AccueilApp(),
    );
  }
}























class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MON APPLY"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async{
        await Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=>const Myscreen(note: null,))
        );
      },
      child: const Icon(Icons.add),
      ),
      body: FutureBuilder <List<Note>?>(
        future: DatabaseHeleper.getAll(),
        builder: (context, AsyncSnapshot<List<Note>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }else if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()),);
          }else if(snapshot.hasData){
            if (snapshot.data != null) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => NoteWidget(
                note: snapshot.data![index], onTap: () async {
                  await Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=>Myscreen(note: snapshot.data![index],)));
                }
                ) 
                );
            }
          }
          return const Text("Helo man");
        }
        
        )
    );
  }
}




class NoteWidget extends StatelessWidget {
  final Note note;
  final VoidCallback onTap;

  const NoteWidget({Key? key, required this.note, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Card(
        child: Text(note.title, style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),)
      ),
    ),
    );
  }
}