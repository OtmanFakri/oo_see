import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oo_see/View/watch_movie.dart';

import '../Controllor/Contollor_Detail.dart';
import '../Models/Cast.dart';
import '../Models/D_Movie.dart';
import '../utilits/Time_convert.dart';

class DetailPage extends StatelessWidget {



  late D_Movie detail;
  late List<dynamic> Cast;
  DetailPage(this.detail,this.Cast);
  var controller =Get.put(Controllor_Detail()); // it'll work!
  @override
  Widget build(BuildContext context) {
    TextStyle _StyleTitle=TextStyle(
      color: Colors.white,
      fontSize: 18,
    );

    return GetBuilder<Controllor_Detail>(
        init: Controllor_Detail(),
        builder: (conto){
      return Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height *0.55,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://www.themoviedb.org/t/p/w500"+detail.posterPath.toString()),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.95)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                ),
              ),
            ),
          ),
          Scaffold(
            backgroundColor:Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //image
                    Padding(padding: EdgeInsets.only(
                        top: 55,
                        right: 5,
                        left: 50
                    ),
                      child: Container(
                        width:  Get.width*0.29,
                        height: Get.height*0.19,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("https://www.themoviedb.org/t/p/w500"+detail.posterPath.toString()),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),),
                    //info
                    Padding(padding: EdgeInsets.only(
                      top: 55,
                    ),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Padding(padding: EdgeInsets.only(top: 10,bottom: 2,left: 10),
                            child: Container(
                              width:MediaQuery.of(context).size.width*0.50,
                              child: Text(detail.title.toString(),style: _StyleTitle),
                            ),),
                          Padding(padding: EdgeInsets.only(left: 10,bottom: 2),
                            child: Container(
                              child: Text(formatTime(detail.runtime?.toInt() ?? 0).toString(),style: _StyleTitle),
                            ),),
                          Padding(padding: EdgeInsets.only(left: 10,bottom: 2),
                            child: Container(
                              child: Text(detail.releaseDate.toString(),style: _StyleTitle),
                            ),),
                          Padding(padding: EdgeInsets.only(left: 10,bottom: 2),
                            child: Container(
                              child: Text(detail.originalLanguage.toString().toUpperCase(),style: _StyleTitle),
                            ),),
                          Padding(padding: EdgeInsets.only(left: 10,bottom: 2),
                            child: Container(
                              width: Get.width * 0.50,
                              child: Wrap(
                                children: detail.genres!.map((e) => Text(e.name.toString()+" , ",style: _StyleTitle,)).toList(),
                              ),
                            ),),
                        ],
                      ),)
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 20,left: 10,right: 10),
                child: Text(detail.overview.toString(),style: TextStyle(
                  fontSize: 16,color: Colors.white60
                ),),),
                SizedBox(
                  width: Get.width,
                  child: Padding(padding: EdgeInsets.all(10),
                    child: ElevatedButton(child: Text("Play"),
                        style: ElevatedButton.styleFrom(
                        backgroundColor:Colors.transparent,
                          side: BorderSide(width:3, color:Colors.grey),
                        ),
                        onPressed: (){
                      Get.to(Watch(detail.id.toString()));
                        }),),
                ),
                Padding(padding: EdgeInsets.all(5),
                child: Text("Cast :",style: _StyleTitle),),
                Expanded(child:ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: Cast.length,
                    itemBuilder: (context,index){
                  return _Cast(N: Cast[index].name, P: Cast[index].profilePath);
                })),


              ],
            ),
          ),



        ],
      );
    });
  }

  _Cast({String N="xxx",String P="https://flyingcdn-e81424e1.b-cdn.net/wp-content/uploads/2020/01/6.png"}) {
    return Padding(padding: EdgeInsets.only(left: 10,right: 10),
    child: Container(
      width: Get.width *0.30,
      //height: Get.height*51,
      //color: Colors.white,
      child: Column(
        children: [
          Container(
            width: Get.width,
            height: Get.height*0.19,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(P=="xx" ?"https://flyingcdn-e81424e1.b-cdn.net/wp-content/uploads/2020/01/6.png": "https://www.themoviedb.org/t/p/w138_and_h175_face$P"),
                  fit: BoxFit.cover
              ),
            ),
          ),
          Expanded(child: Text(N,style: TextStyle(color: Colors.white,fontSize: 15),))
        ],
      ),
    ),);
  }


}


