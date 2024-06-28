import 'package:flutter/material.dart';

import 'index.dart';

class Apropo extends StatelessWidget {
  const Apropo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF363636),
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AccueilApp()));
          }, 
          icon: const Icon(Icons.arrow_back_ios_new)
          ),
        title:const Text("A propos", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFF363636),
        child:const Column(
          children: [
            SizedBox(height: 20,),
            Text("Savoir Biblique", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Divider(color: Colors.white, height: 10, thickness: 2, indent: 50,endIndent: 50,),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Savoir biblique est une application qui a pour but d’approfondir les connaissances de la bible pour les chrétiens et permet aux gens de rencontrer Jésus christ le sauveur de l’humanité tout comme il nous a confié la mission de rependre la bonne nouvelle partout dans le monde cette application aide les non croyants à connaitre Dieu suite à des histoires tirées de la sainte bible.",style: TextStyle(color: Colors.white),),
            ),
            SizedBox(height: 20,),
            Text("Contacter le Developpeur", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Divider(color: Colors.white, height: 10, thickness: 2, indent: 50,endIndent: 50,),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Je suis Jospin Ndagano un chretien developpeur web et mobile",style: TextStyle(color: Colors.white),),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Je suis Jospin Ndagano un chretien developpeur web et mobile",style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}