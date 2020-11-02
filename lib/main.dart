import 'package:flutter/material.dart';
// import 'pages/details/details.dart';
import 'pages/signIn/signIn.dart';

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
      home: new SignIn(),
    );
  }
}





