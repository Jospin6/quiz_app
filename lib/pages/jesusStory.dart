import 'package:flutter/material.dart';

import 'jesusStoryList.dart';
import 'showJLife.dart';

class JesusStory extends StatefulWidget {
  const JesusStory({Key? key}) : super(key: key);

  @override
  State<JesusStory> createState() => _JesusStoryState();
}

class _JesusStoryState extends State<JesusStory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF363636),
      appBar: AppBar(
        backgroundColor: const Color(0xFF363636),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white,)),
        title: const Text("Qui est Jesus ?", style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFF363636),
        child: ListView.builder(
          itemCount: jlist.length,
          itemBuilder: (context, index) {
            final data = jlist[index];
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>showJLife(data: data,)));
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