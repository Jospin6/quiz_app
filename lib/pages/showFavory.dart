import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

import 'db.dart';

// ignore: must_be_immutable
class ShowFavory extends StatefulWidget {
  int index;
   ShowFavory({super.key, required this.index});
  @override
  State<ShowFavory> createState() => _ShowFavoryState();
}

class _ShowFavoryState extends State<ShowFavory> {
  late PageController _pageController;

  Db getdb = Db();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
     _pageController = PageController(initialPage: widget.index);
  }



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
          icon: const Icon(Icons.arrow_back_ios_new)),
        title:const Text("Favory"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFF363636),
        child: FutureBuilder <List<Map<String, dynamic>>?>(
          future: getdb.getAll(),
          builder: (context, snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }else if(snapshot.hasError){
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }else if(snapshot.hasData){
              if (snapshot.data != null) {
                return PageView.builder(
            controller: _pageController,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {


              void _copyToClipboard(BuildContext context) {
                Clipboard.setData(ClipboardData(text: "${snapshot.data![index]["citation"]}-${snapshot.data![index]["verset"]}"));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Le texte a été copié dans le presse-papiers.'),
                  ),
                );
              }

              return Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    margin: const EdgeInsets.only(
                        top: 20, left: 20, right: 20, bottom: 70),
                    padding: const EdgeInsets.only(
                        top: 50, left: 20, right: 20, bottom: 20),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(50, 255, 255, 255),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white)),
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          margin: const EdgeInsets.only(bottom: 30),
                          child: Center(
                            child: Text(
                              "${snapshot.data![index]['content']}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            left: 0,
                            child: SizedBox(
                              height: 20,
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "${snapshot.data![index]["verset"]}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                              ),
                            )
                            ),
                      ],
                    ),
                  ),
                  Positioned(
                            bottom: 0,
                            left: 0,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.white,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        Share.share("${snapshot.data![index]["content"]}-${snapshot.data![index]["verset"]}");
                                      },
                                      icon: const Icon(
                                        Icons.share,
                                        color: Colors.white,
                                      )
                                      ),
                                  
                                  IconButton(
                                      onPressed: () => _copyToClipboard(context),
                                      icon: const Icon(
                                        Icons.copy,
                                        color: Colors.white,
                                      )),
                                  RotatedBox(
                                    quarterTurns: 2,
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.arrow_back_ios,
                                          color: Colors.white,
                                        )),
                                  ),
                                ],
                              ),
                            )
                            ),
                ],
              );
            });
              }
            }
            return const Text("Y a une erreur");
          })
      ),
    );
  }
}


      