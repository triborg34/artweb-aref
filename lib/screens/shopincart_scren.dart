// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:forcomp/model/network.dart';
import 'package:forcomp/screens/allscreen.dart';
import 'package:forcomp/util/controllest.dart';
import 'package:get/get.dart';

class ShopinCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Get.find<ShopingController>().shopingcart.isEmpty
          ? Empty()
          : ShopSection(),)
    );
  }
}

Widget Empty() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: 200,
            height: 200,
            child: Image.asset(
              'assets/images/noCart.png',
              color: Colors.purple,
            )),
        SizedBox(
          height: 10,
        ),
        Text(
          "سبد شما خالی است...",
          textDirection: TextDirection.rtl,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 35),
          height: 50,
          width: Get.width,
          child: ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.purple,
                elevation: 0,
              ),
              onPressed: () {
                Get.to(AllScreen(
                    catproducst: Get.find<Network>().producst,
                    title: "همه محصولات"));
              },
              child: Text(
                "افزودن محصول به سبد خرید...",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textDirection: TextDirection.rtl,
              )),
        )
      ],
    ),
  );
}

class ShopSection extends StatelessWidget {
  const ShopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 15, 5, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Get.width,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.purple, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                "سبد خرید",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 550,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return CartWidget(index: index);
                },
                separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                itemCount: Get.find<ShopingController>().shopingcart.length),
          ),
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                onPressed: () {
                  Get.to(AllScreen(
                      catproducst: Get.find<Network>().producst,
                      title: "همه محصولات"));
                },
                child: Text(
                  "ادامه خرید",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.purple),
              )),
              SizedBox(
                width: 15,
              ),
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "تسویه",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.purple)))
            ],
          )
        ],
      ),
    );
  }
}

class CartWidget extends StatelessWidget {
  int index;
  CartWidget({required this.index});
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Center(
                      child: Container(
                        width: 200,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "آیا میخواید حذف کنید؟",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.red),
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text("خیر")),
                                SizedBox(
                                  width: 15,
                                ),
                                ElevatedButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.green),
                                    onPressed: () {
                                      Get.find<ShopingController>()
                                          .shopingcart
                                          .removeAt(index);
                                      Get.back();
                                    },
                                    child: Text("بله"))
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Icon(Icons.delete_outline),
              style: TextButton.styleFrom(backgroundColor: Colors.red),
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Get.find<ShopingController>().shopingcart[index].title ??
                      "Title",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "${Get.find<ShopingController>().shopingcart[index].price} هزار تومان",
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
                  image: DecorationImage(
                      image: NetworkImage(Get.find<ShopingController>()
                          .shopingcart[index]
                          .image!))),
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
        ));
  }
}
