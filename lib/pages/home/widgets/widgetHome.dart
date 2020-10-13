import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../details/details.dart';
import 'package:AppYnov/repository/tmdb/repository.dart';
import 'package:AppYnov/models/movies_model.dart';


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

                      new ListViewBuilderPrint()  
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

                      new ListViewBuilderPrint()              
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

                      new ListViewBuilderPrint()              
                    ],
                  )
                ),

                // Rangé 4 -> Test scroll
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: <Widget>[
                      // Alignement du titre
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text("Test Scroll",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      new ListViewBuilderPrint()              
                    ],
                  )
                )


              ]
            )
          )
        ]
      )
    );
  }
}


// Construction de la listeViewBuilder Widget
class ListViewBuilderPrint extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return new SizedBox(
      height: 175.0,
      child: ListView.builder(
        // physics: ClampingScrollPhysics(),
        // shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => new DetailPage())),

          // Mise en forme des images
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0, right: 30.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                'assets/images/imgFilm.jpg',
                fit: BoxFit.cover,
                ),
            ),
          ),

        )
      ),
    );
  }
}

// class ListViewBuilderPrint2 extends StatelessWidget {
//   @override
//   Widget build (BuildContext context) {
//     return new Scaffold(
//       body: FutureBuilder(
//         future: RepoTMDB.fetchData(),
//         builder: (BuildContext context, AsyncSnapshot<List<MovieModel>> snapshot){
//           if(snapshot.connectionState != ConnectionState.done) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else {
//             List<MovieModel> movies = snapshot.data;
//             return ListView(
//               children: movies
//               .map(
//                 (MovieModel movies) => ListTile(
//                 title: Text(movies.title),
//                 ),
//               )
//               .toList()
//             );   
//           }
//         },
//       ),
//     );
//   }
// }