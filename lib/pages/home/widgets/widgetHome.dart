import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:AppYnov/repository/tmdb/repository.dart';


class HomeWidget extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return new SingleChildScrollView(
      child: new Column(
        // mainAxisSize: MainAxisSize.min,
        children:[

          new Container(
            color: Colors.grey[850],
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: new Column(
              children: [
                // Rangé 1 -> Popular movies
                Container(
                  margin: const EdgeInsets.only(top: 40.0),
                  child: Column(
                    children: <Widget>[
                      // Alignement du titre
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text("Popular movies",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      new ListViewBuilderPopularMovie()  
                      // new ListViewBuilderPrint2()            
                    ],
                  )
                ),

                // Rangé 2 -> Popular TV Shows
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: <Widget>[
                      // Alignement du titre
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text("Popular TV Shows",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      new ListViewBuilderPopularTV()              
                    ],
                  )
                ),

                // Rangé 3 -> Best Movies
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: <Widget>[
                      // Alignement du titre
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text("Best Movies",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      new ListViewBuilderBestMovies()              
                    ],
                  )
                ),

                // // Rangé 4 -> Movie upcoming
                // Container(
                //   margin: const EdgeInsets.only(top: 20.0),
                //   child: Column(
                //     children: <Widget>[
                //       // Alignement du titre
                //       Align(
                //         alignment: Alignment.centerLeft,
                //         child: Container(
                //           child: Text("A venir",
                //             style: TextStyle(
                //               fontSize: 25,
                //               fontWeight: FontWeight.bold,
                //               color: Colors.white,
                //             ),
                //           ),
                //         ),
                //       ),

                //       new ListViewBuilderMoviesUpcoming()              
                //     ],
                //   )
                // )


              ]
            )
          )
        ]
      )
    );
  }
}


// Construction de la listeViewBuilder Widget
class ListViewBuilderPopularMovie extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return new SizedBox(
      height: 175.0,
       
      child: FutureBuilder(
        future: RepoTMDB.fetchDataPopularMovies(),
        builder: (context, snapshot){
          if(snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => new DetailPage())),

                // Mise en forme des images
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0, right: 30.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                      'https://image.tmdb.org/t/p/original'+snapshot.data[index].poster,
                      fit: BoxFit.cover,
                      ),
                  ),
                ),

              )
            );
          }
        },
      ),

    );
  }
}

// Construction de la listeViewBuilder Widget
class ListViewBuilderPopularTV extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return new SizedBox(
      height: 175.0,
       
      child: FutureBuilder(
        future: RepoTMDB.fetchDataPopularTvShow(),
        builder: (context, snapshot){
          if(snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => new DetailPage())),

                // Mise en forme des images
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0, right: 30.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                      'https://image.tmdb.org/t/p/original'+snapshot.data[index].poster,
                      fit: BoxFit.cover,
                      ),
                  ),
                ),

              )
            );
          }
        },
      ),

    );
  }
}


// Construction de la listeViewBuilder Widget
class ListViewBuilderBestMovies extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return new SizedBox(
      height: 175.0,
       
      child: FutureBuilder(
        future: RepoTMDB.fetchDataBestMovies(),
        builder: (context, snapshot){
          if(snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => new DetailPage())),

                // Mise en forme des images
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0, right: 30.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                      'https://image.tmdb.org/t/p/original'+snapshot.data[index].poster,
                      fit: BoxFit.cover,
                      ),
                  ),
                ),

              )
            );
          }
        },
      ),

    );
  }
}

// // Construction de la listeViewBuilder Widget
// class ListViewBuilderMoviesUpcoming extends StatelessWidget {
//   @override
//   Widget build (BuildContext context) {
//     return new SizedBox(
//       height: 175.0,
       
//       child: FutureBuilder(
//         future: RepoTMDB.fetchDataMoviesUpcoming(),
//         builder: (context, snapshot){
//           if(snapshot.connectionState != ConnectionState.done) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else {
//             return ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: snapshot.data.length,
//               itemBuilder: (BuildContext context, int index) => GestureDetector(
//                 // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => new DetailPage())),

//                 // Mise en forme des images
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 5.0, right: 30.0),
//                   child: ClipRRect(
//                       borderRadius: BorderRadius.circular(5),
//                       child: Image.network(
//                       'https://image.tmdb.org/t/p/original'+snapshot.data[index].poster,
//                       fit: BoxFit.cover,
//                       ),
//                   ),
//                 ),

//               )
//             );
//           }
//         },
//       ),

//     );
//   }
// }