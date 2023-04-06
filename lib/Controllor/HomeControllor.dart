
import 'package:get/get.dart';
import 'package:oo_see/Models/Movie.dart';
import 'package:oo_see/Service/Service_Animes.dart';
import 'package:oo_see/Service/Service_Series.dart';
import 'package:flutter/material.dart';
import '../Service/Serive_Movie.dart';
class HomeControllor extends GetxController{

  List<String> Home =["movie","series","animes"];
  List<dynamic> Posts=[];
  int page=1;
  Service_Movie ServiceMovie=Service_Movie();
  Service_Series ServiceSeries=Service_Series();
  Service_Anime ServiceAnime=Service_Anime();
  int index=0;

  @override
  void onInit() {
    Controllor(index);
    CS.addListener(() {
      if (CS.position.pixels== CS.position.maxScrollExtent){
        page++;
        Controllor(index);

      }
    });
  }
  void F_Movie(){
    ServiceMovie.GetMovie(page).then((value) {
      Posts.addAll(value);
      update();
    });
  }
  void F_Series(){
    ServiceSeries.GetSeries(page).then((value) {
      Posts.addAll(value);
      update();
    });
  }
  void F_Anime(){
    ServiceAnime.GetAnime().then((value) {
      Posts.addAll(value);
      update();
    });
  }
  void Controllor(int _index){
    switch (_index){
      case 0:
        F_Movie();
        break;
      case 1:
        F_Series();
        break;
      case 2:
        F_Anime();
    }
  }

  ScrollController CS=ScrollController();
}