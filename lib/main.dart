import 'package:AppYnov/pages/home/home.dart';
import 'package:flutter/material.dart';
// import 'pages/details/details.dart';
import 'pages/home/home.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:AppYnov/repository/tmdb/repository.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  //Paramètre de l'application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Elective',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false, //Etiquette de debug (coin haut à droite)
      home: new Home(),
      // home: new FutureTest(),
    );
  }
}





