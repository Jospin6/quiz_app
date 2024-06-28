import 'package:flutter/material.dart';

import 'db.dart';
import 'showFavory.dart';

class Favory extends StatefulWidget {
  const Favory({super.key});

  @override
  State<Favory> createState() => _FavoryState();
}

class _FavoryState extends State<Favory> with SingleTickerProviderStateMixin {


 Db getdb = Db();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF363636),
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: const Icon(Icons.arrow_back_ios_new)),
        title: const Text("Favory"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFF363636),
      ),
      body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: FutureBuilder <List<Map<String, dynamic>>>(
            future: getdb.getAll(),
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return CircularProgressIndicator();
              }else if(snapshot.hasError){
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }else if(snapshot.hasData){
                if (snapshot.data != null) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index){
                      return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>ShowFavory(index: snapshot.data![index]['id'] - 1,)));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(50, 255, 255, 255),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white)),
                  child: ListTile(
                    title: Text(snapshot.data![index]['content'].length >30 ?
                    "${snapshot.data![index]['content'].substring(0, 30)}...":
                    snapshot.data![index]['content'],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
                    });
                }
              }
              return Text("y a un probleme");
            })
        )
    );
  }
}