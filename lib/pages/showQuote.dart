
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

import 'db.dart';

class ShowCote extends StatefulWidget {
  final titlen;
  final int index;
  final datas;
  const ShowCote({Key? key,required this.titlen, required this.index, required this.datas})
      : super(key: key);

  @override
  State<ShowCote> createState() => _ShowCoteState();
}

class _ShowCoteState extends State<ShowCote> {
  late PageController _pageController;

  Db database = Db();
  @override
  void initState() {
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
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        centerTitle: true,
        title: Text(
          "${widget.titlen}",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFF363636),
        child: PageView.builder(
            controller: _pageController,
            itemCount: widget.datas.length,
            itemBuilder: (context, index) {
              final dt = widget.datas[index];


              void _copyToClipboard(BuildContext context) {
                Clipboard.setData(ClipboardData(text: dt["citation"]));
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
                              dt["citation"],
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
                                dt["verset"],
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
                                        Share.share("${dt["citation"]}-${dt["verset"]}");
                                      },
                                      icon: const Icon(
                                        Icons.share,
                                        color: Colors.white,
                                      )
                                      ),
                                  IconButton(
                                      onPressed: () async{
                                        await database.insert(dt['citation'],dt['verset']);
                                        setState(() async {
                                          dt['isFavory'] =
                                              !dt['isFavory']!;
                                          
                                        });
                                      },
                                      icon: dt['isFavory']
                                          ? const Icon(
                                              Icons.favorite,
                                              color: Colors.white,
                                            )
                                          : const Icon(
                                              Icons.favorite_border,
                                              color: Colors.white,
                                            )),
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
            }),
      ),
    );
  }
}
