import 'package:bible_mindset/pages/showStorie.dart';
import 'package:flutter/material.dart';
import 'stories.dart';

class Histoire extends StatefulWidget {
  const Histoire({Key? key}) : super(key: key);

  @override
  State<Histoire> createState() => _HistoireState();
}

class _HistoireState extends State<Histoire> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF363636),
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white,)
          ),
        title: const Text("Les histoires de la bible", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(bottom: 10),
        color: const Color(0xFF363636),
        child: ListView.builder(
          itemCount: stories.length,
          itemBuilder: (context, index) {
            final data = stories[index];
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>showStorie(data: data,)));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(50, 255, 255, 255),
                ),
                child: ListTile(
                  title: Text(data["title"], style: const TextStyle(color: Colors.white),),
                ),
              ),
              
            );
          }
          )
      ),

    );
  }
}