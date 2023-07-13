// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:forcomp/model/producstmodel.dart';
import 'package:forcomp/model/shopingmodel.dart';
import 'package:forcomp/screens/detials_screen.dart';
import 'package:forcomp/screens/mianviewscreen.dart';

import 'package:forcomp/util/controllest.dart';
import 'package:get/get.dart';

class AllScreen extends StatelessWidget {
  List<Producst> catproducst = <Producst>[];
  String title;
  AllScreen({required this.catproducst, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: (){
          Get.to(MainvaiewPage());
        }, icon: Icon(Icons.home_outlined,color: Colors.white,))],
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Get.to(DetailsScreen(selectedProducs: catproducst[index]));
                  },
                  child: CatWidget(
                    index: index,
                    catproducst: catproducst,
                  ));
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 15,
              );
            },
            itemCount: catproducst.length),
      ),
    );
  }
}

class CatWidget extends StatelessWidget {
  int index;
  List<Producst> catproducst = <Producst>[];
  CatWidget({required this.index, required this.catproducst});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Container(
          child: ElevatedButton(
            onPressed: () {
              Get.find<ShopingController>().shopingcart.add(ShopModel(
                  id: catproducst[index].id,
                  title: catproducst[index].name,
                  category: catproducst[index].categories![0].name,
                  description: catproducst[index].description,
                  image: catproducst[index].images![0].src,price: catproducst[index].price));

                   Get.snackbar("اضافه شد",'' ,backgroundColor: Colors.purple,colorText: Colors.white,duration: Duration(seconds: 1));
                             
            },
            child: Icon(Icons.shopping_cart_checkout_outlined),
            style: TextButton.styleFrom(backgroundColor: Colors.green),
          ),
        ),
        Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              catproducst[index].name!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              "${catproducst[index].price} هزار تومان",
              textDirection: TextDirection.rtl,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: NetworkImage(catproducst[index].images![0].src!),
                  fit: BoxFit.fill)),
          width: 75,
        )
      ]),
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            width: 2.0,
            color: Colors.purple.withOpacity(0.5),
          )),
    );
  }
}
