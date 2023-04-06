import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/Series.dart';
import '../utilits/API_Config.dart';

class Service_Series{

  Future<List<Series>> GetSeries(page) async{
    String BaseUrl=Base_URl+V2+Seriess+newwat;
    List<Series> ListSeries=[];
    var Res= await http.get(Uri.parse("https://api.themoviedb.org/3/tv/popular?api_key=7a2f6eb9b6aa01651000f0a9324db835&page=$page"));
    var data=jsonDecode(Res.body);
    if(Res.statusCode == 200){
      for(var post in data["results"]){
        ListSeries.add(Series.fromJson(post));
      }
    }else{
      print("error");
    }
    return ListSeries;
  }
}