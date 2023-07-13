// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:forcomp/model/producstmodel.dart';
import 'package:forcomp/model/shopingmodel.dart';
import 'package:forcomp/screens/homescreen.dart';
import 'package:forcomp/screens/mianviewscreen.dart';

import 'package:forcomp/util/controllest.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  Producst selectedProducs;
  DetailsScreen({required this.selectedProducs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.purple,
       actions: [IconButton(onPressed: (){
          Get.to(MainvaiewPage());
        }, icon: Icon(Icons.home_outlined,color: Colors.white,))]),
      backgroundColor: Colors.white,
      body: Container(
          padding: EdgeInsets.all(15),
          child: Column(children: [
            Container(
              height: 300,
              child: PageView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Hero(
                    tag: "photo",
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                                image: NetworkImage(
                                    selectedProducs.images![index].src!),
                                fit: BoxFit.cover))),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.white54,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${selectedProducs.price} تومان ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            textDirection: TextDirection.rtl),
                        Text(
                          selectedProducs.name ?? "Title",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                        width: Get.width,
                        child: ElevatedButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.purple),
                            onPressed: () {
                              Get.find<ShopingController>().shopingcart.add(ShopModel(
                                  id: selectedProducs.id,
                                  title: selectedProducs.name,
                                  category: selectedProducs.categories![0].name,
                                  description: selectedProducs.description,
                                  image: selectedProducs.images![0].src,
                                  price: selectedProducs.price));

                                  Get.snackbar("اضافه شد",'' ,backgroundColor: Colors.purple,colorText: Colors.white);
                                  Get.find<SceensControllers>().body=HomeScreen();
                                   Get.find<SceensControllers>()..bnIndex=0;
                                   Get.to(MainvaiewPage());

                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "اضافه کردن به سبد خرید",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            )))
                  ],
                ),
              ),
            )
          ])),
    );
  }
}
