import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import '../Controllor/Contollor_Detail.dart';
import '../Controllor/Controller_Movie.dart';
import '../Controllor/HomeControllor.dart';
import '../Service/Service_D-Movie.dart';
import '../utilits/Binding.dart';
import 'Detail.dart';
import 'Series-detail.dart';
class Movie extends StatefulWidget {
  const Movie({Key? key}) : super(key: key);

  @override
  State<Movie> createState() => _MovieState();
}

class _MovieState extends State<Movie> {

  late int CIndex=0;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllor>(
      init: HomeControllor(),
      builder: (val) {
      return Scaffold(
        backgroundColor:Color(0xff222831),
        bottomNavigationBar: Padding(padding: EdgeInsets.all(5),
            child: GNav(
              gap: 5,
              padding: EdgeInsets.all(15),
              color: Color(0xff393E46),
              tabActiveBorder: Border.all(
                  color: Colors.white24
              ),
              activeColor: Colors.white,
              onTabChange: (index){
                setState((){
                  val.index=index;
                  CIndex=index;
                  val.Posts.clear();
                  val.Controllor(index);
                });

              },
              tabs: [
                GButton(icon: Icons.movie_creation_outlined,text: "Movie",),
                GButton(icon: Icons.tv,text: "TV Series"),
                GButton(icon: Icons.animation,text: "Anime"),
              ],)),
        body:Column(
          children: [
            //sherch filter
            Row(
              children: [
               Padding(padding: EdgeInsets.only(left: 10,top: 50,right: 10),
                 child: Container(height: 50,width: 300,child: Input(),),),
                Padding(padding: EdgeInsets.only(left: 2,top: 50,right: 10),
                child: InkWell(
                  onTap: (){},
                  child: Container(height: 30,width: 50,
                      child: Image.asset("Assets/Icons/filter.png")),
                ),)
              ],
            ),
            //list
            Expanded(child: GridView.builder(
              controller: val.CS,
              itemCount: val.Posts.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {

                    setState(()  {

                      Get.bottomSheet(
                      backgroundColor: Color(0xff393E46),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),

                      Detail(val.Posts[index])

                      );



                      });

                  },
                  child:index != val.Posts ? CardItem(index):CircularProgressIndicator(),
                );
              }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 180,
              mainAxisSpacing: 10,
            ),),),
          ],
        ),

      );
    },);
  }

  Input() {
    return TextField(
      style: TextStyle(color: Colors.white,fontSize: 18),
      decoration: InputDecoration(hintText: "What\'s on your mind",border: OutlineInputBorder()),
    );
  }

  Widget CardItem(int index) {
    return Padding(padding: EdgeInsets.only(left: 0,right: 0),
      child: Container(
      //height: 50,
        child:GetBuilder<HomeControllor>(
          builder: (val) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 5,right: 5),
                  child: ClipRRect(
                    //
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network("https://image.tmdb.org/t/p/w500"+val.Posts[index].posterPath,
                        fit: BoxFit.cover,
                        width: double.infinity,

                        height: Get.height * 0.20),
                  ),
                ),
                SizedBox(height: 5,),
                Expanded(child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(val.Posts[index].title,
                    maxLines: 1,
                    style: TextStyle(fontSize: 14,color: Colors.white),),
                )),
              ],
            );
          },
        ),
    ),);
  }

  Widget Detail(var item) {
    return Container(
        height: Get.height *0.35,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Raw
           Container(

             height: Get.height *0.20,

             child:  Row(
               children: [
                 //image
                 Padding(padding: EdgeInsets.all(10),
                 child: Container(
                   width: Get.width *0.25,
                   child: Image.network("https://image.tmdb.org/t/p/w500"+item.posterPath),
                 ),),
                 //title
                 Expanded(child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     //title
                     Padding(padding: EdgeInsets.only(top: 10,left: 2,right: 2),
                     child: Text(item.title,style:TextStyle(
                       fontSize: 23,
                       fontWeight: FontWeight.bold,
                       color: Colors.white
                     )),),
                     //annes time raining
                     Text("Vote Average : "+item.voteAverage.toStringAsFixed(1).toString(),style: TextStyle(color: Colors.white)),
                     //summer
                     Expanded(child: Container(

                       width: Get.width,
                       child: Padding(padding: EdgeInsets.only(top:2,left: 2,),
                       child: SingleChildScrollView(
                         child: Text(item.overview,

                           style: TextStyle(color: Colors.white70),),
                       )),
                     ),),

                   ],
                 )),
               ],
             ),
           ),
            Container(
            padding: EdgeInsets.only(left: 25,bottom: 5),
              child: CircleAvatar(
                backgroundColor: Color(0xff2C3639),
                child: Text("Play",style: TextStyle(color: Colors.white)),
              maxRadius:30 ,
              ),
            ),
            Container(
              height: 1,
              color: Colors.white,
            ),
            //
           Expanded(child:  Container(
             padding: EdgeInsets.only(left: 10),
              child: GetBuilder<Controllor_Detail>(
                init: Controllor_Detail(),
                builder: (val1) {
                  return InkWell(
                    onTap: () async {
                      switch(CIndex){
                        case 0:
                          await val1.D_(index: CIndex, imdb: item.id.toString());
                          Get.to(DetailPage(val1.detai[0],val1.cast),binding: Binding_Detail());
                          break;
                        case 1:
                          await val1.D_(index: CIndex, imdb: item.id.toString());
                          Get.to(Series_detail(val1.detai[0]),binding: Binding_Detail());
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("More Info ...",style: TextStyle(fontSize: 20,color: Colors.white)),
                        ),
                        Padding(padding: EdgeInsets.only(right: 10),child: Icon(Icons.navigate_next,size: 30,color: Colors.white,),)
                      ],
                    ),
                  );
                },
              ),
           ),)
          ],
        ));
  }


}
