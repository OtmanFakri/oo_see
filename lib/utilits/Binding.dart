import 'package:get/get.dart';

import '../Controllor/Contollor_Detail.dart';
class Binding_Detail implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => Controllor_Detail());
  }

}