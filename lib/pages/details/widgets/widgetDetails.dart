import 'package:AppYnov/repository/tmdb/repository.dart';
import 'package:flutter/material.dart';

// Widget Principal
class DetailsWidget extends StatelessWidget {
  final int id;
  final String title;
  final String poster;
  final dynamic average;
  final String description;
  final String date;
  final type;

  DetailsWidget(this.id, this.title, this.poster, this.average, this.description, this.date, this.type);
  
  @override
  Widget build(BuildContext context) {
    return new Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://image.tmdb.org/t/p/original'+ poster,
            fit: BoxFit.cover,
          ),

          new SingleChildScrollView(
            child:
            // Black Bottom Gradient
            new Container(
            // Responsive sur tout les devices
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.only(top: 160.0),
            
            // Background Gradient 
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.5],
                colors: [Colors.transparent, Colors.grey[850]]
                )
            ), 

            child: new Column(
              children: [
                // Rangé 1 -> Titre du filme
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 155.0, right: 30.0, left: 30.0),
                  //Texte titre
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 30.0,
                        )
                      )
                  )
                ),

                // Rangé 2 -> Infos
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 30.0,
                  margin: EdgeInsets.only(right: 30.0, left: 30.0),
                  child: new Row(
                    children: [
                      // Colonne 1 -> Age
                      Container(
                        child: 
                        Text("15+  -",
                        style: TextStyle( 
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 14.0,
                              )
                        )
                      ),

                      // Colonne 2 -> Date
                      Container(
                        child: Text(
                          '  ' + date + '  -',
                          style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 14.0,
                          )
                        )
                      ),

                      // Colonne 3 -> Note
                      Container(
                        child: Row(
                          // Concaténation de l'icon et du texte
                          children: <Widget>[
                            Text('  '),
                            Icon(Icons.star,
                            color: Colors.tealAccent[400],
                            size: 16.0,
                            ),
                            Text('  '+ average.toString(),
                              style: TextStyle( 
                              fontWeight: FontWeight.bold,
                              color: Colors.tealAccent[400],
                              fontSize: 14.0,
                              )
                            )
                          ]
                        )
                      )
                    ]
                  )
                ),

                // Rangé 3 -> Genres
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(right: 30.0, left: 30.0),
                  child: DisplayGenre(id, type)
                ),

                // Rangé 4 -> Acteurs
                Container(
                  height: 55.0,
                  margin: EdgeInsets.only(top: 10.0, right: 30.0, left: 30.0, bottom: 10.0),
                  width: MediaQuery.of(context).size.width,
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cast: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold, 
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                      DisplayActors(id, type)
                    ]                    
                  )
                ),

                // Rangé 5 -> Sommaire
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(right: 30.0, left: 30.0),
                  child: new Column(
                    children: [

                      //Rangé 1 -> Titre "Summary"
                      Container(
                        // color: Colors.orange,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Summary',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15.0,
                              )
                            )
                        )
                      ),

                      // Rangé 2 -> Text sommaire
                       Container(
                          margin: EdgeInsets.only(top: 5.0),
                          child: Text(
                            description,
                            // maxLines: 4,
                            // overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          )
                      )
                    ]
                  )
                )

              ],
            ),
            )
        
          )

        ],
    );
  }  
}


// Widgets Secondaires (liste d'acteurs, liste de genres)
// Widget List Actors
class DisplayActors extends StatelessWidget{
  final int id;
  final type;
  DisplayActors(this.id, this.type);

  @override
  Widget build (BuildContext context){
    return new Expanded(
      child: 
        FutureBuilder(
        future: RepoTMDB.fetchDataCast("$id", "$type"),
        builder: (context, snapshot){
          //Test de la connexion - On affiche un loader
          if(snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          //Sinon on construit la liste 
          else {
            return Wrap(
              children: 
              snapshot.data.map((item) => 
                Text(item.actors+",",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                )
              ).toList().cast<Widget>(),
            );
          }
        },
        ),
    );
  }
}


// Widget List Genres
class DisplayGenre extends StatelessWidget{
  final int id;
  final type;
  DisplayGenre(this.id, this.type);

  @override
  Widget build (BuildContext context){
    return new Wrap(
      children: [
        Container(
          child: FutureBuilder(
            future: RepoTMDB.fetchDataDetails("$id", "$type", "genres"),
            builder: (context, snapshot){
              if(snapshot.connectionState != ConnectionState.done) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Wrap(
                  children: 
                  snapshot.data.map((item) => 
                  Container(
                    margin: EdgeInsets.only(right: 10.0),
                    child: 
                    FlatButton(
                      child: Text(
                      item.genres,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      color: Colors.grey[300],
                      onPressed: () {},
                    ),
                  )
                  ).toList().cast<Widget>(),
                );
              }
            },
          ),
        ),
      ]
    );
  }
}