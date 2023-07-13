import 'package:forcomp/model/postmodel.dart';
import 'package:forcomp/model/producstmodel.dart';
import 'package:forcomp/model/shopingmodel.dart';
import 'package:forcomp/util/constanst.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:woocommerce_api/woocommerce_api.dart';

class Network extends GetxController {


  RxList<ShopModel> electronic = <ShopModel>[].obs;
  RxList<PostModel> posts=<PostModel>[].obs;
  RxList<Categories> categorys = <Categories>[].obs;
  RxList<Categories> tempcategorys = <Categories>[].obs;

  RxList<Producst> producst = <Producst>[].obs;

  @override
  void onInit() async {
    WooCommerceAPI wooCommerceAPI = WooCommerceAPI(
        url: ApiConstants.url,
        consumerKey: ApiConstants.ck,
        consumerSecret: ApiConstants.cs);

    var res = await wooCommerceAPI.getAsync('products');
    for (var items in res) {
      producst.add(Producst.fromJson(items));
    }

    var catres = await wooCommerceAPI.getAsync('products/categories');
    for (var cats in catres) {
      tempcategorys.add(Categories.fromJson(cats));
    }
    categorys.value = tempcategorys.reversed.toList();
    ;

    var postres = await http
        .get(Uri.parse('https://eddy.dastyar.site/wp-json/wp/v2/posts?_embed'));
        
        var jsond=convert.jsonDecode(postres.body);
        
         
        
        
        for(var json in jsond){
          
          
          posts.add(PostModel.fromJson(json));
        }
        print(posts.first.title!.rendered );
        
      
       

     

    super.onInit();
  }
}

