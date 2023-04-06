import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/Cast.dart';
import '../utilits/API_Config.dart';

class Service_Cast{

  Future<List<cast>> GetC_Movie(String imdb) async{
    List<cast> Cast=[];
    var Res= await http.get(Uri.parse("https://api.themoviedb.org/3/movie/$imdb/credits?api_key=7a2f6eb9b6aa01651000f0a9324db835"));
    //var Res1= await http.get(Uri.parse("https://api.themoviedb.org/3/movie/$imdb?api_key=e547e17d4e91f3e62a571655cd1ccaff"));
    var data=jsonDecode(Res.body);
    if(Res.statusCode == 200){
      for(var itamCast in data["cast"]){
        Cast.add(cast.fromJson(itamCast));
      }
    }else{
      print("error");
    }
    return Cast;
  }
}