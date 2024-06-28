import 'package:bible_mindset/pages/quotes.dart';
import 'package:flutter/material.dart';
import 'favorite.dart';
import 'listCitations.dart';

class Citations extends StatefulWidget {
  const Citations({Key? key}) : super(key: key);

  @override
  State<Citations> createState() => _CitationsState();
}

class _CitationsState extends State<Citations> {
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
        centerTitle: true,
        title: const Text("Citations Biblique", style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Favory()));
            }, 
            icon: const Icon(Icons.favorite, color: Colors.white,))
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFF363636),
        child: ListView.builder(
          itemCount: quotes.length,
          itemBuilder: (context, index) {
            final data = quotes[index];
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Quotes(data: data,)));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(50, 255, 255, 255),
                ),
                child: ListTile(
                  title: Text(data["categorie"], style: const TextStyle(color: Colors.white),),
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
