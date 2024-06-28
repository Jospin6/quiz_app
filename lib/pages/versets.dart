// import 'package:bible/providers.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:flutter/services.dart' show rootBundle;

// class Verset extends StatefulWidget {
//   const Verset({Key? key}) : super(key: key);

//   @override
//   State<Verset> createState() => _VersetState();
// }

// class _VersetState extends State<Verset> {
//  Map<String, dynamic> _bibleData = {};
//   String _searchWord = '';
//   Map<String, dynamic> _searchResults = {};

//  List<Map<String, dynamic>> data = [];  
  
// @override
//   void initState() {
//     super.initState();
//     getData();
//   }
//    Future<void> getData() async {
//     String url = 'fr_apee.json"'; // Remplacez cette URL par l'emplacement de votre fichier JSON
//     setState(() async {
//         data = liste;
//       });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           onPressed: (){
//             Navigator.pop(context);
//           }, 
//           icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black,)),
//         title: Text("Verset Biblique", style: TextStyle(color: Colors.black),),
//       ),
//       body:  Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Nom : ${data['name']}'),
//             Text('Abbreviation : ${data['abbrev']}'),
//             Text('Chapitres :'),
//             Column(
//               children: data['chapters'].map<Widget>((chapitre) => Text(chapitre.toString())).toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// List<Map<String, dynamic>> liste = [
//     {
//         "abbrev": "gn", 
//         "chapters": [
// [
//  "Dieu, au commencement, créa les cieux et la terre;", 
//  "en une masse fluide et sans forme, et les ténèbres étaient à la surface de l'espace, et le Souffle de Dieu en agitait les eaux.", 
//  "Et Dieu dit: Que la lumière soit; et son rayonnement fut."
// ]
// ], 
// "name":"genese" }
// ];
