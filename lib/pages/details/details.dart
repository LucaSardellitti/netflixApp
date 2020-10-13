import 'package:flutter/material.dart';
import 'widgets/widgetDetails.dart';

class DetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return new _DetailPage();
  }
}

class _DetailPage extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     // Header de l'application
     extendBodyBehindAppBar: true,//Body en arriere plan de la navbar
     appBar: new AppBar(
       leading: IconButton(
          onPressed: () => Navigator.pop(context, false),// Retour à la page précédente
          icon: Icon(Icons.arrow_back),
        ),
       
       
       // Ce qui se trouve avant le titre
      //  title: new Text("Ynov Elective Flutter"),// Titre dans la AppBar
       elevation: 20.0,// Ombre de l'AppBar
       backgroundColor: Colors.black.withOpacity(0.6),
     ),

     // Corps de l'application
     body: new DetailsWidget()
   );
  }
}