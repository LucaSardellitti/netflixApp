import 'dart:convert';
import 'package:AppYnov/models/movies_model.dart';
import 'package:http/http.dart' as http;

class RepoTMDB {

  //Un Future est utilisé pour représenter une  valeur qui sera disponible plus tard
  //Future pour les Films populaires; Séries populaires; Meilleurs films: Films à venir
  static Future<List<MovieModel>> fetchData(type) async{
    String url;

    if(type == "popularMovie"){
      url = "https://api.themoviedb.org/3/movie/popular?api_key=62feaff3d2cf094a340f530fbf25bde9";
    }
    else if(type == "popularTv"){
      url = "https://api.themoviedb.org/3/tv/popular?api_key=62feaff3d2cf094a340f530fbf25bde9";
    }
    else if(type == "bestMovies"){
      url = "https://api.themoviedb.org/3/movie/top_rated?api_key=62feaff3d2cf094a340f530fbf25bde9";
    }
    else if(type == "upcomingMovies"){
      url = "https://api.themoviedb.org/3/movie/upcoming?api_key=62feaff3d2cf094a340f530fbf25bde9";
    }

    final response = await http.get(url);
    var jsonData = json.decode(response.body)['results'];
    List<MovieModel> movies = [];

    for(var data in jsonData){
      movies.add(MovieModel.fromJson(data));
    }
    return movies;
  }

  //Future pour le cast des Films; Séries
  static Future<List<MovieModel>> fetchDataCast(id, type) async{
    String url;

    if(type == "movie"){
      url = "https://api.themoviedb.org/3/movie/"+id+"/credits?api_key=62feaff3d2cf094a340f530fbf25bde9";
    }
    else if(type == "tvShow"){
      url = "https://api.themoviedb.org/3/tv/"+id+"/credits?api_key=62feaff3d2cf094a340f530fbf25bde9";
    }

    final response = await http.get(url);
    var jsonData = json.decode(response.body)['cast'];
    List<MovieModel> actors = [];

    for(var data in jsonData){
      actors.add(MovieModel.fromJson(data));
    }

    return actors;
  }

  //Future pour le details des Films; Series
  static Future<List<MovieModel>> fetchDataDetails(id, type, val) async{
    String url;

    if(type == "movie"){
      url = "https://api.themoviedb.org/3/movie/"+id+"?api_key=62feaff3d2cf094a340f530fbf25bde9";
    }
    else if(type == "tvShow"){
      url = "https://api.themoviedb.org/3/tv/"+id+"?api_key=62feaff3d2cf094a340f530fbf25bde9";
    }

    var jsonData;

    final response = await http.get(url);
    if(val != null){
      jsonData = json.decode(response.body)[val];
    }
    else {
      jsonData = json.decode(response.body);
    }
    
    List<MovieModel> values = [];

    for(var data in jsonData){
      values.add(MovieModel.fromJson(data));
    }

    return values;
  }

}