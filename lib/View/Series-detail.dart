import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Models/D_Series.dart';
class Series_detail extends StatelessWidget {

  late D_Series D_series;

  Series_detail(this.D_series);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: Get.height *0.50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://www.themoviedb.org/t/p/w300_and_h450_bestv2/"+D_series.backdropPath.toString()),
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
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //image
                _hder(),
                SizedBox(height: 15,),
                Padding(padding: EdgeInsets.only(left: 10,right: 10),
                  child: _Buttom_start(),),
                Padding(padding: EdgeInsets.only(top: 25,right: 20,left: 20),
                  child: _Description(),),
                Padding(padding: EdgeInsets.only(left: 10,right: 20,top: 10,bottom: 10),
                child: Container(width: double.infinity,height: Get.height*0.1,child: _custeur(),),),
                Text("Episodes",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,color: Colors.white)),
                Padding(padding: EdgeInsets.all(10),
                child: _BouttonDrop(),),
                _ListSre()
              ],
            ) ,
          ),
        ),
      ],
    );
  }

Widget _hder() {
    return Padding(padding: EdgeInsets.only(top: 144,left: 16),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(left: 2,right: 12),
          child: Container(
            width: 104,
            height: 156,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("https://www.themoviedb.org/t/p/w300_and_h450_bestv2/"+D_series.posterPath.toString()),
                    fit: BoxFit.cover
                )
            ),
          ),),
        Expanded(child: Padding(
          padding: EdgeInsets.only(top: 10,right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Padding(padding: EdgeInsets.only(right: 10),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(children: [
                  Text(D_series.originalName.toString(),style: TextStyle(color: Colors.white),),
                ],),
                Text(D_series.numberOfSeasons.toString()+" Seasons",style: TextStyle(color: Colors.white),),
              ],
            ),
            SizedBox(height: Get.height*0.020,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(D_series.firstAirDate.toString(),style: TextStyle(color: Colors.white),),
                Text(D_series.originalLanguage.toString().toUpperCase(),style: TextStyle(color: Colors.white),),
              ],
            ),
          ],)),
              SizedBox(height: Get.height*0.060,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.white,)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.star_rate_rounded,color: Colors.white,)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.share,color: Colors.white,)),
                ],
              ),
            ],
          ),
        )),
      ],
    ),);
}

  _Buttom_start() {
    return ElevatedButton.icon(
      icon: Icon(Icons.play_arrow_sharp),
      onPressed: (){},
      label: Text("Play"),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red.shade800,
        minimumSize:Size(Get.width,44),
        shape:StadiumBorder(),
        elevation: 30,
        shadowColor: Colors.red.shade800,
      ),
    );
  }

  _Description() {
    return Text(
      "A look at the personal and professional lives of a group of women who perform for a wrestling organization in Los Angeles during the 1980s.",
      style: TextStyle(
        color: Colors.white,
        fontSize: 17,

      ),
    );
  }

  _custeur() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        CircleAvatar(
          backgroundColor: Colors.green,
          maxRadius: 44,
        ),
        SizedBox(width: 10,),
        CircleAvatar(backgroundColor: Colors.green,maxRadius: 44,),
        SizedBox(width: 10,),


      ],
    );
  }

  _ListSre() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
          width: double.infinity,
          height: Get.height *0.25,
          color: Colors.blueGrey,
        ),)
      ],
    );
  }

  _BouttonDrop() {
    List<String> item=['One', 'Two', 'Free', 'Four'];
    String? _dropDownValue;
    return DropdownButton<String>(
      items: item.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: _dropDownValue== null ? Text("Is Null"):Text(value, style: TextStyle(color: Colors.blue) ,),
        );
      }).toList(),
      style: TextStyle(
        color: Colors.white,

      ),
      onChanged: (va) {
        _dropDownValue=va;
      },
    );
  }
}
