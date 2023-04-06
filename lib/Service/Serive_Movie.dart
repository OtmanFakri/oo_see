import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/Movie.dart';
import '../utilits/API_Config.dart';

class Service_Movie{

  Future<List<Movie>> GetMovie(int page) async{
    String BaseUrl=Base_URl+V1+Movies+newwat;
    List<Movie> ListMovies=[];
    var Res= await http.get(Uri.parse("https://api.themoviedb.org/3/movie/popular?api_key=7a2f6eb9b6aa01651000f0a9324db835&page=$page"));
    var data=jsonDecode(Res.body);
    if(Res.statusCode == 200){
      for(var movie1 in data["results"]){
        ListMovies.add(Movie.fromJson(movie1));
      }
    }else{
      print("error");
    }
    return ListMovies;
  }
}