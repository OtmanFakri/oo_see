import 'package:get/get.dart';
import 'package:oo_see/utilits/Binding.dart';

import 'View/Detail.dart';
import 'View/Movie.dart';
class url{
  static var urlpage=[
    GetPage(name: "/movie", page: ()=>Movie()),

  ];
}