import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/Animes.dart';
import '../Models/Series.dart';
import '../utilits/API_Config.dart';

class Service_Anime{

  Future<List<Anime>> GetAnime() async{
    String BaseUrl=Base_URl+V1+Animes+newwat;
    List<Anime> ListAnime=[];
    var Res= await http.get(Uri.parse(BaseUrl+"?limit=20"));

    if(Res.statusCode == 200){
      for(var post in jsonDecode(Res.body)){
        ListAnime.add(Anime.fromJson(post));
      }
    }else{
      print("error");
    }
    return ListAnime;
  }
}