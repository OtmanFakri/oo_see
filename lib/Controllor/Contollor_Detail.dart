import 'package:get/get.dart';
import 'package:oo_see/Service/Service_Cast.dart';
import 'package:oo_see/Service/Service_D-Series.dart';

import '../Models/Cast.dart';
import '../Models/Cast.dart';
import '../Service/Service_D-Movie.dart';

class Controllor_Detail extends GetxController{
  List<dynamic> detai=[];
  List<dynamic> cast=[];
  Service_D_Movie ServiceDM=Service_D_Movie();
  Service_Cast ServiceCM=Service_Cast();

  Service_D_Series ServiceDS=Service_D_Series();




  Future<void> D_({required int index,required String imdb})async {
    switch(index){
      case 0:
        await GetDMovie(imdb);
        break;
      case 1:
        await GetDTV(imdb);
        break;

    }
  }


  Future<void> GetDMovie(String imdb)async{
    await ServiceDM.GetD_Movie(imdb).then((value) {
      detai.clear();
      detai.addAll(value);
      update();
    });
    await ServiceCM.GetC_Movie(imdb).then((value) {
      cast.clear();
      cast.addAll(value);
      update();
    });
  }


  //TV show
  Future<void> GetDTV(String imdb)async{
    await ServiceDS.GetD_Series(imdb).then((value) {
      detai.clear();
      detai.addAll(value);
      update();
    });

  }

}