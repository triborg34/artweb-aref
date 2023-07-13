// ignore_for_file: unused_local_variable

import 'dart:convert' as covnert;

import 'package:forcomp/util/constanst.dart';
import 'package:http/http.dart' as http;

import 'package:forcomp/model/coustmermodel.dart';
import 'package:forcomp/model/loginmodel.dart';
import 'package:woocommerce_api/woocommerce_api.dart';

const String token = "https://eddy.dastyar.site/wp-json/jwt-auth/v1/token";

class Singup {
  static Future<CoustomerModel> createCustomer(CoustomerModel model) async {
    CoustomerModel cmodel=CoustomerModel();
    WooCommerceAPI wooCommerceAPI = WooCommerceAPI(
        url: ApiConstants.url,
        consumerKey: ApiConstants.ck,
        consumerSecret: ApiConstants.cs);
    try {
      var response =
          await wooCommerceAPI.postAsync('customers', model.toJson());
    cmodel=CoustomerModel.fromJson(response);
      print(response); // JSON Object with response
    } catch (e) {
      print(e);
    }
    return cmodel;
  }

  static Future<LoginModel> loginCustomer(
    String username,
    String password,
  ) async {
    LoginModel model = LoginModel();
    var resposne = await http.post(Uri.parse(token),
        body: {"username": username, "password": password}).then((value) {
      var jdec = covnert.jsonDecode(value.body);

      model = LoginModel.fromJson(jdec);
    });
    
    return model;
  }
}





  






















// class ApiConstants{
//  static const String token = "http://nesusgaming.gigfa.com/wp-json/jwt-auth/v1/token";
// }
 

// class ApiConstants {
//   static const String customerUrl = "customers";
//   static const String key = "ck_4ff5e231ffc732ce05ed9e45e03232e4c06f18a2";
//   static const String secret = "cs_e448491ad797b8f2b0e828efa57c6be3fb694df9";
//   static const String baseUrl = "http://localhost/world/wp-json/wc/v3/";
//   // static const String token = "http://nesusgaming.gigfa.com/wp-json/jwt-auth/v1/token";
//   static const String category = "products/categories";
//   static const String products = "products";
//   static const String todayofferTagId = "24";
//   static const String topSellingsProductsId = "25";
// }


  // static Future<bool> createCustomer(CoustomerModel model) async {
  //   bool res = false;
  //   try {
  //     var response = await Dio().post(
  //         '${ApiConstants.baseUrl}${ApiConstants.customerUrl}?consumer_key=${ApiConstants.key}&consumer_secret=${ApiConstants.secret}',
  //         data: model.toJson(),
  //         options: Options(headers: {
  //           //HttpHeaders.authorizationHeader: 'Bearer $authToken',
  //           HttpHeaders.contentTypeHeader: "application/json",
  //         }));
  //     print('inaj');
  //     print(response.statusCode);
  //     print(response);
  //     if (response.statusCode == 201 || response.statusCode == 200) {
  //       res = true;
  //     }
  //   } on DioException catch (e) {
  //     print("on");
  //     print(e.toString());
  //     if (e.response!.statusCode == 404) {
  //       res = false;
  //     } else {
  //       res = false;
  //     }
  //   }

  //   return res;
  // }
