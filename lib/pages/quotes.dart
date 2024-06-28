import 'package:bible_mindset/pages/showQuote.dart';
import 'package:flutter/material.dart';

import 'db.dart';

class Quotes extends StatefulWidget {
  final data;
  const Quotes({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {

  Db database = Db();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF363636),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        centerTitle: true,
        title: Text(
          widget.data['categorie'],
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(bottom: 10),
        color: const Color(0xFF363636),
        child: ListView.builder(
            itemCount: widget.data['citations'].length,
            itemBuilder: (context, index) {
              final titlen = widget.data['categorie'];
              final infos = widget.data['citations'];
              final datas = widget.data['citations'][index];
              String quote = datas["citation"];
              // bool fav = datas["isFavory"];
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowCote(
                                titlen: titlen,
                                index: index,
                                datas: infos,
                              )));
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
                    title: Text(
                      quote.length > 30
                          ? "${quote.substring(0, 30)}..."
                          : "${datas["citation"]}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: IconButton(
                        onPressed: () async{
                          await database.insert(datas["citation"],datas["verset"]);
                          setState(() {
                            datas["isFavory"] = !datas["isFavory"]!;
                          });
                        },
                        icon: datas["isFavory"]
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.white,
                              )
                            : const Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              )),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
