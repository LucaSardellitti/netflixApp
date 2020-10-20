import 'package:flutter/material.dart';
import 'widgets/widgetDetails.dart';

class DetailPage extends StatefulWidget {
  final int id;
  final String title;
  final String poster;
  final dynamic average;
  final String description;
  final String date;
  final String type;
  // final String genres;
  DetailPage(this.id, this.title, this.poster, this.average, this.description, this.date, this.type);

  @override
  State<StatefulWidget> createState(){
    return new _DetailPage(this.id, this.title, this.poster, this.average, this.description, this.date, this.type);
  }
}


class _DetailPage extends State<DetailPage> {
  final int id;
  final String title;
  final String poster;
  final dynamic average;
  final String description;
  final String date;
  final String type;
  // final String genres;
  _DetailPage(this.id, this.title, this.poster, this.average, this.description, this.date, this.type);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     // Header de l'application
     extendBodyBehindAppBar: true,//Body en arriere plan de la navbar
     appBar: new AppBar(
       elevation: 20.0,// Ombre de l'AppBar
       backgroundColor: Colors.black.withOpacity(0.6),
       // Ce qui se trouve avant le titre
       leading: IconButton(
          onPressed: () => Navigator.pop(context, false),// Retour à la page précédente
          icon: Icon(Icons.arrow_back),
        ),
     ),

     // Corps de l'application
     body: new DetailsWidget(this.id, this.title, this.poster, this.average, this.description, this.date, this.type)
   );
  }
}