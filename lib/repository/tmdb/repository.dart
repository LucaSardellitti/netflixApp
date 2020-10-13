import 'package:http/http.dart' as http;

class RepoTMDB {
  static Future<String> fetchData() async{
    String url = "https://api.themoviedb.org/3/movie/76341?api_key=62feaff3d2cf094a340f530fbf25bde9";

    final response = await http.get(url);
    if(response.statusCode == 200){
      return response.body;
    }
    else {
      return "Une erreur est survenue";
    }
  }
}
