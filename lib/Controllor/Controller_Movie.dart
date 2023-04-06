import 'package:get/get.dart';
import 'package:oo_see/Service/Service_D-Movie.dart';
import 'package:oo_see/Service/Service_D-Series.dart';

import '../Models/D_Movie.dart';

class Controlloer_D_Movie extends GetxController{

  List<dynamic> detai=[];
  Service_D_Movie ServiceDM=Service_D_Movie();
  Service_D_Series ServiceDS=Service_D_Series();

  Future<void> GetDMovie(String imdb)async{
    await ServiceDM.GetD_Movie(imdb).then((value) {
      detai.clear();
      detai.addAll(value);
      update();
    });
  }
  Future<void> GetDSeries(String imdb)async{
    await ServiceDS.GetD_Series(imdb).then((value) {
      detai.clear();
      detai.addAll(value);
      print(detai[0]);
      update();
    });
  }

  Future<void> D_({required int index,required String imdb})async {
    switch(index){
      case 0:
        await GetDMovie(imdb);
        //print(detai[detai.length -1]);
        break;
      case 1:
        await GetDSeries(imdb);
        break;
    }
  }
}