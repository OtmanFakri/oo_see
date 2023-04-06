import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/D_Movie.dart';
import '../Models/D_Series.dart';
import '../utilits/API_Config.dart';

class Service_D_Series{

  Future<List<D_Series>> GetD_Series(String imdb) async{
    String BaseUrl=Base_URl;
    List<D_Series> D_Series1=[];
    var Res= await http.get(Uri.parse("https://api.themoviedb.org/3/tv/$imdb?api_key=7a2f6eb9b6aa01651000f0a9324db835"));
    var data=jsonDecode(Res.body);
    if(Res.statusCode == 200){
      D_Series1.add(D_Series.fromJson(data));
    }else{
      print(" SEre error");
    }
    return D_Series1;
  }
}