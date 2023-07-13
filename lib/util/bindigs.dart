
import 'package:forcomp/model/network.dart';
import 'package:forcomp/util/controllest.dart';
import 'package:get/get.dart';

class Mybindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SceensControllers());
    Get.put(Network());
    Get.put(ViewController());
    Get.lazyPut(() => SingsControllers());
    Get.lazyPut(() => ShopingController());
  }

}