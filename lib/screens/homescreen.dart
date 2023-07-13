import 'package:flutter/material.dart';

import 'package:forcomp/model/network.dart';
import 'package:forcomp/screens/detials_screen.dart';
import 'package:forcomp/util/constanst.dart';
import 'package:forcomp/util/controllest.dart';
import 'package:forcomp/util/widgest.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBar(),
            SizedBox(
              height: 10,
            ),
            Container(
                height: 250,
                child: GetBuilder<ViewController>(
                  id: 2,
                  builder: (controller) {
                    return PageView.builder(
                      reverse: true,
                      onPageChanged: (value) {
                        Get.find<ViewController>().selectedIndex = value;
                        Get.find<ViewController>().update([2]);
                      },
                      controller: PageController(
                          viewportFraction: 0.8,
                          initialPage:
                              Get.find<ViewController>().selectedIndex),
                      itemCount: pageviewImages.length,
                      itemBuilder: (context, index) {
                        var _scale =
                            Get.find<ViewController>().selectedIndex == index
                                ? 1.0
                                : 0.8;
                        return TweenAnimationBuilder(
                          duration: Duration(milliseconds: 350),
                          curve: Curves.ease,
                          tween: Tween(begin: _scale, end: _scale),
                          builder: (context, value, child) {
                            return Transform.scale(
                              child: child,
                              scale: value,
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: AnimatedOpacity(
                              duration: Duration(milliseconds: 350),
                              opacity:
                                  Get.find<ViewController>().selectedIndex ==
                                          index
                                      ? 1.0
                                      : 0.5,
                              curve: Curves.bounceIn,
                              child: Image.asset(
                                pageviewImages[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                )),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      Get.snackbar("title", "message");
                    },
                    child: Container(
                        padding: EdgeInsets.all(5),
                        color: Colors.purple,
                        child: Text(
                          "مشاهده همه",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ))),
                Text(
                  "محصولات اخیر",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 300,
              child: ListView.separated(
                  reverse: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => DetailsScreen(
                            selectedProducs:
                                Get.find<Network>().producst[index]));
                      },
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                height: 200,
                                child: Image.network(Get.find<Network>()
                                    .producst[index]
                                    .images![0]
                                    .src!)),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              Get.find<Network>().producst[index].name!,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "قیمت:${Get.find<Network>().producst[index].price!} تومان",
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 10,
                    );
                  },
                  itemCount: 3),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "مطالب اخیر...",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Obx(
              () {
                return Container(
                  height: 270,
                  child: Get.find<Network>().posts.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.separated(
                          reverse: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 200,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      height: 200,
                                      child: Image.network(Get.find<Network>()
                                              .posts[index]
                                              .embedded!.wpfeaturedmedia==null
                                          ? imgurl
                                          : Get.find<Network>()
                                                  .posts[index]
                                                  .embedded!
                                                  .wpfeaturedmedia[0]
                                              ['source_url'])),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Text(
                                      Get.find<Network>()
                                              .posts[index]
                                              .title!
                                              .rendered ??
                                          "This is Title",
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 25,
                            );
                          },
                          itemCount: Get.find<Network>().posts.length),
                );
              },
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    ));
  }
}

class MiddleShows extends StatelessWidget {
  const MiddleShows({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 150,
      width: 200,
      child: Stack(children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "سرعت در دریافت",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'با ما در سریع ترین زمان در ارتباط باشید',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                )
              ],
            ),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            height: 120,
            width: 200,
          ),
        ),
        Align(
            alignment: Alignment.topCenter,
            child: CircleAvatar(
              child: CircleAvatar(
                radius: 15,
                child: Icon(
                  Icons.lightbulb_outline,
                  color: Colors.purple,
                ),
                backgroundColor: Colors.white,
              ),
              radius: 26,
              backgroundColor: Colors.purple,
            )),
      ]),
    );
  }
}

// ignore: must_be_immutable
class CatCircular extends StatelessWidget {
  int i;
  List catnames;
  List imageCats;
  CatCircular({
    required this.i,
    required this.catnames,
    required this.imageCats,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 75,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 75,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.purple.withOpacity(0.5)),
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(image: AssetImage(imageCats[i]))),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            catnames[i],
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
