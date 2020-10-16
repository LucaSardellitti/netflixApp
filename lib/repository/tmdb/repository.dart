import 'dart:convert';
import 'package:AppYnov/models/movies_model.dart';
import 'package:http/http.dart' as http;

class RepoTMDB {

  //Un Future est utilisé pour représenter une  valeur qui sera disponible plus tard
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

  static Future<List<MovieModel>> fetchDataMoviesCast(id) async{
    String url = "https://api.themoviedb.org/3/movie/"+id+"/credits?api_key=62feaff3d2cf094a340f530fbf25bde9";

    final response = await http.get(url);
    var jsonData = json.decode(response.body)['cast'];
    List<MovieModel> actors = [];

    for(var data in jsonData){
      actors.add(MovieModel.fromJson(data));
    }

    return actors;
  }

  static Future<List<MovieModel>> fetchDataMoviesDetails(id, type) async{
    String url = "https://api.themoviedb.org/3/movie/"+id+"?api_key=62feaff3d2cf094a340f530fbf25bde9";

    var jsonData;

    final response = await http.get(url);
    if(type != null){
      jsonData = json.decode(response.body)[type];
    }
    else {
      jsonData = json.decode(response.body);
    }
    
    List<MovieModel> genres = [];

    for(var data in jsonData){
      genres.add(MovieModel.fromJson(data));
    }

    return genres;
  }
}