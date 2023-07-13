import 'dart:math';

import 'package:flutter/material.dart';
import 'package:forcomp/model/network.dart';
import 'package:forcomp/model/producstmodel.dart';
import 'package:forcomp/screens/allscreen.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => Get.find<Network>().categorys.isEmpty
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.purple,
              ),
            )
          : Container(
              child: GridView.builder(
                  padding: EdgeInsets.all(15),
                  itemCount: Get.find<Network>().categorys.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      crossAxisCount: 2,
                      mainAxisExtent: 150,
                      childAspectRatio: 16 / 9),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (index == 1) {
                          Get.to(AllScreen(
                            catproducst: Get.find<Network>().producst,
                            title: "همه دسته بندی ها",
                          ));
                        } else {
                          List<Producst> dumplist =
                              Get.find<Network>().producst.where((p0) {
                            for (var el in p0.categories!) {
                              if (el.name ==
                                  Get.find<Network>().categorys[index].name) {
                                return true;
                              }
                            }

                            return false;
                          }).toList();

                          for (var element in dumplist) {
                            print(element.name);
                          }
                          Get.to(() => AllScreen(
                              catproducst: dumplist,
                              title: Get.find<Network>()
                                  .categorys[index]
                                  .name
                                  .toString()));
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.primaries[
                              Random().nextInt(Colors.primaries.length)],
                        ),
                        child: Center(
                            child: Text(
                          Get.find<Network>().categorys[index].name! ==
                                  "Uncategorised"
                              ? "همه دسته بندی ها"
                              : Get.find<Network>().categorys[index].name!,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                BoxShadow(
                                  spreadRadius: 10,
                                  color: Colors.white,
                                  blurRadius: 10,
                                )
                              ]),
                        )),
                      ),
                    );
                  })),
    ));
  }
}
