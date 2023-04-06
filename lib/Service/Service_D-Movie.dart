import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/D_Movie.dart';
import '../utilits/API_Config.dart';

class Service_D_Movie{

  Future<List<D_Movie>> GetD_Movie(String imdb) async{
    List<D_Movie> D_Movie1=[];
    var Res= await http.get(Uri.parse("https://api.themoviedb.org/3/movie/$imdb?api_key=7a2f6eb9b6aa01651000f0a9324db835"));
    //var Res1= await http.get(Uri.parse("https://api.themoviedb.org/3/movie/$imdb?api_key=e547e17d4e91f3e62a571655cd1ccaff"));
    var data=jsonDecode(Res.body);
    if(Res.statusCode == 200){
      D_Movie1.add(D_Movie.fromJson(data));
    }else{
      print(" Movie error");
    }
    return D_Movie1;
  }
}