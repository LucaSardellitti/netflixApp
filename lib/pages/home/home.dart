import 'package:flutter/material.dart';
import 'widgets/widgetHome.dart';
// import 'package:AppYnov/repository/test/TestRepo.dart';
import 'package:AppYnov/repository/tmdb/repository.dart';


class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return new _Home();
  }
}

class _Home extends State<Home> {
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
      // appBar: new AppBar(
      //   title: new Text("HomePage"),
      // ),
      body: new HomeWidget()
    );
  }
}


class FutureTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: RepoTMDB.fetchData(),
        builder: (context, snapshot){
          if(snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: Text(snapshot.data)
            );
          }
        },
      ),
    );
  }
}
