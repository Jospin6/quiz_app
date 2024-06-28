import 'package:flutter/material.dart';

class showJLife extends StatelessWidget {
  final data;
  const showJLife({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(data['image']),
                fit: BoxFit.cover
                )
            ),
          ),
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  }, 
                  icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black,)),
                
                
              ],
            )
            ),
          Container(
            margin: const EdgeInsets.only(top: 200),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color:  Color(0xFF363636),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40)
              )
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 30, bottom: 10, left: 20, right: 20),
                    child: Column(
                      children: [
                        Text(data['title'], style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),),
                        const SizedBox(height: 10,),
                        Text(data['verset'], style: const TextStyle(color: Colors.white, fontSize: 14,), textAlign: TextAlign.center,),
                        const SizedBox(height: 20,),
                        Text(data['content'], style: const TextStyle(color: Colors.white, fontSize: 14,),),
                        
                      ],
                    )
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}