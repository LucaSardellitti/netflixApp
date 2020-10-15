import 'package:AppYnov/repository/tmdb/repository.dart';
import 'package:flutter/material.dart';

class DetailsWidget extends StatelessWidget {
  final int id;
  final String title;
  final String poster;
  // final dynamic average;
  final String description;
  final String date;
  DetailsWidget(this.id, this.title, this.poster, /*this.average,*/ this.description, this.date);
  
  @override
  Widget build(BuildContext context) {
    return new Stack(
        fit: StackFit.expand,
        // alignment: .bottomCenter,
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
                        child: Text(
                          '15+  -',
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
                          '  '+ date +'  -',
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
                            Text('  In test'/*+ average*/,
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
                  height: 50.0,
                  margin: EdgeInsets.only(right: 30.0, left: 30.0),
                  child: new Wrap(
                    children: [
                      // Genre 1
                      Container(
                        margin: EdgeInsets.only(right: 10.0),
                        //Button style
                        child: SizedBox(
                          width: 65,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(6.0)),
                            onPressed: () {},
                            child: new Text(
                              'Crime', 
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold
                              )
                            )
                          )
                        )
                      ),

                      // Genre 2
                      Container(
                        margin: EdgeInsets.only(right: 10.0),
                         //Button style
                        child: SizedBox(
                          width: 65,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(6.0)),
                            onPressed: () {},
                            child: new Text(
                              'Drama', 
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold
                              )
                            )
                          )
                        )
                      ),

                      // Genre 3
                      Container(
                        //Button style
                        child: SizedBox(
                          width: 70,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(6.0)),
                            onPressed: () {},
                            child: new Text(
                              'Mystery', 
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold
                              )
                            )
                          )
                        )
                      )

                    ]
                  )
                ),

                // Rangé 4 -> Acteurs
                Container(
                  color: Colors.orange,
                  width: MediaQuery.of(context).size.width,
                  height: 50.0,
                  margin: EdgeInsets.only(right: 30.0, left: 30.0),
                  child: new Column(
                    children: [
                      // Rangé 2 -> Text sommaire
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        //Un FutureBuilder permet d'afficher de manière asynchrone les résultats d'un Future
                        child: FutureBuilder(
                          future: RepoTMDB.fetchDataPopularMovies(),
                          builder: (context, snapshot){
                            //Test de la connexion - On affiche un loader
                            if(snapshot.connectionState != ConnectionState.done) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            //Sinon on construit la liste 
                            else {
                              return ListView.builder(
                                itemBuilder: (BuildContext context, int index) => GestureDetector(
                                  // Mise en forme des images
                                  child: Text(
                                    snapshot.data[index].actors,
                                  ),

                                )
                              );
                            }
                          },
                        ),
                        // child: Text.rich(
                        //   TextSpan(
                        //     children: <TextSpan>[
                        //       // Premier texte
                        //       TextSpan(
                        //         text: ' Cast: ', 
                        //         style: TextStyle(
                        //           fontWeight: FontWeight.bold, 
                        //           color: Colors.white,
                        //           fontSize: 12.0,
                        //         )
                        //       ),

                        //      // Deuxième texte
                        //     //  TextSpan(
                        //     //     // text: 'Millie Bobby Brown, Henry Cavill, Sam Clafin, Helena Bonham Carter', 
                        //     //     text: actors, 
                        //     //     style: TextStyle(
                        //     //       fontStyle: FontStyle.italic,
                        //     //       color: Colors.white,
                        //     //       fontSize: 12.0,
                        //     //     )
                        //     //   ),
                        //     ],
                        //   ),
                        // ),
                      ),
                                  
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
