import 'dart:convert';
import 'package:AppYnov/models/movies_model.dart';
import 'package:http/http.dart' as http;

class RepoTMDB {

  static Future<List<MovieModel>> fetchDataPopularMovies() async{
      String url = "https://api.themoviedb.org/3/movie/popular?api_key=62feaff3d2cf094a340f530fbf25bde9";

      final response = await http.get(url);
      var jsonData = json.decode(response.body)['results'];
      List<MovieModel> movies = [];

      for(var data in jsonData){
        movies.add(MovieModel.fromJson(data));
      }

      return movies;
    }


    static Future<List<MovieModel>> fetchDataPopularTvShow() async{
      String url = "https://api.themoviedb.org/3/tv/popular?api_key=62feaff3d2cf094a340f530fbf25bde9";

      final response = await http.get(url);
      var jsonData = json.decode(response.body)['results'];
      List<MovieModel> movies = [];

      for(var data in jsonData){
        movies.add(MovieModel.fromJson(data));
      }

      return movies;
    }


    static Future<List<MovieModel>> fetchDataBestMovies() async{
      String url = "https://api.themoviedb.org/3/movie/top_rated?api_key=62feaff3d2cf094a340f530fbf25bde9";

      final response = await http.get(url);
      var jsonData = json.decode(response.body)['results'];
      List<MovieModel> movies = [];

      for(var data in jsonData){
        movies.add(MovieModel.fromJson(data));
      }

      return movies;
    }


    // static Future<List<MovieModel>> fetchDataMoviesUpcoming() async{
    //   String url = "https://api.themoviedb.org/3/movie/upcoming?api_key=62feaff3d2cf094a340f530fbf25bde9";

    //   final response = await http.get(url);
    //   var jsonData = json.decode(response.body)['results'];
    //   List<MovieModel> movies = [];

    //   for(var data in jsonData){
    //     movies.add(MovieModel.fromJson(data));
    //   }

    //   return movies;
    // }
}