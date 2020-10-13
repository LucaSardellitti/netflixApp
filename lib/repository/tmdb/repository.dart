import 'dart:convert';
// import 'dart:html';

import 'package:AppYnov/models/movies_model.dart';
import 'package:http/http.dart' as http;

class RepoTMDB {

  static Future<List<MovieModel>> fetchData() async{
    String url = "https://api.themoviedb.org/3/movie/popular?api_key=62feaff3d2cf094a340f530fbf25bde9";

    final response = await http.get(url);

    if(response.statusCode == 200){
      dynamic body = jsonDecode(response.body);

      List<MovieModel> movies = body.map((dynamic item) => MovieModel.fromJson(item)).toList();
      return movies;
    }
    else {
      throw "Une erreur est survenue";
    }
  }
}
