import 'package:flutter/material.dart';
import 'bdd.dart';
import 'model.dart';

class Myscreen extends StatelessWidget {
  final Note? note;
  const Myscreen({Key? key, required this.note}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    // ignore: unused_local_variable
    final idController = TextEditingController();
    final titleCont = TextEditingController();

  if (note != null) {
    titleCont.text = note!.title;
  }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text("Editer une note",  style: TextStyle(color: Colors.white),),
        ),
        body: Padding(padding: const EdgeInsets.all(10),
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                TextFormField(
                  decoration: const InputDecoration(
                    label: Text("Title"),
                    hintText: "Entrer le titre",
                    border: OutlineInputBorder()
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuiller completer le champs";
                    }
                    return null;
                  },
                  controller: titleCont,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      final titles = titleCont.text;

                      final Note modal = Note(id: note?.id, title: titles);
                      if (note == null) {
                        await DatabaseHeleper.addNote(modal);
                      }else{
                        await DatabaseHeleper.updateNote(modal);
                      }

                      Navigator.pop(context);


                    }
                  }, 
                  child: Text(note == null ?"valider": "editer", style: const TextStyle(color: Colors.white),))
              ],
            ),
          ),
        ),
        ),
      ),
    );
  }
}