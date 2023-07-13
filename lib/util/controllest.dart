import 'package:flutter/cupertino.dart';
import 'package:forcomp/model/shopingmodel.dart';
import 'package:forcomp/screens/homescreen.dart';
import 'package:get/get.dart';

class SceensControllers extends GetxController{
  var bnIndex=0;
  Widget body=HomeScreen();
  
}

class ViewController extends GetxController{
  var selectedIndex=0;
}

class SingsControllers extends GetxController{
  var isSingup=false.obs;
  var isLogin=false.obs;
}

class ShopingController extends GetxController{
  RxList<ShopModel> shopingcart=<ShopModel>[].obs;
}