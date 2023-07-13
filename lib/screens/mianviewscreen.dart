
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:forcomp/model/network.dart';
import 'package:forcomp/screens/shopincart_scren.dart';
import 'package:forcomp/screens/cats_screen.dart';

import 'package:forcomp/screens/singup_in_screen.dart';
import 'package:forcomp/screens/homescreen.dart';

import 'package:forcomp/util/controllest.dart';
import 'package:get/get.dart';

class MainvaiewPage extends StatelessWidget {
  const MainvaiewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: FluidNavBar(
          defaultIndex: Get.find<SceensControllers>().bnIndex,
            onChange: (selectedIndex) {
               Get.find<SceensControllers>().bnIndex=selectedIndex;
              
              switch (selectedIndex) {
                case 0:
                
                  Get.find<SceensControllers>().body=HomeScreen();
                  
                  break;
                     case 1:
                  Get.find<SceensControllers>().body=ShopinCartScreen();
                  
                  break;
                     case 2:
                  Get.find<SceensControllers>().body=CategoryScreen();
                  
                  break;
                     case 3:
                  Get.find<SceensControllers>().body=SingUp_InScreen();
                  
                  break;
                default:
                Get.find<SceensControllers>().body=HomeScreen();
                break;
              }
              Get.find<SceensControllers>().update();


            },
            style: FluidNavBarStyle(
                barBackgroundColor: Colors.purple,
                iconUnselectedForegroundColor: Colors.grey,
                iconSelectedForegroundColor: Colors.white,
                iconBackgroundColor: Colors.purple),
            icons: [
              FluidNavBarIcon(
                icon: Icons.home_outlined,
              ),
              FluidNavBarIcon(
                icon: Icons.shopping_cart,
              ),
              FluidNavBarIcon(icon: Icons.explore_outlined),
              FluidNavBarIcon(icon: Icons.person)
            ]),
        body: GetBuilder<SceensControllers>(
          builder: (controller) {
            return Obx(() {
              if (Get.find<Network>().producst.isEmpty) {
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.purple,
                ));
              } else {
                return Get.find<SceensControllers>().body;
              }
            });
          },
        ),
      ),
    );
  }
}

/* 

CircularBottomNavigation(
          tabItems,
          selectedPos: selectedPos,
          controller: _navicontroller,
          selectedCallback: (selectedPos) {
            selectedPos = _navicontroller.value;

            
            switch (selectedPos) {
              case 0:
               Get.find<SceensControllers>().body=Zero();
               Get.find<SceensControllers>().title.value='Zero';
                
                break;
              case 1:
               Get.find<SceensControllers>().body=One();
               Get.find<SceensControllers>().title.value="One";
               break;
                case 2:
               Get.find<SceensControllers>().body=HomeScreen();

               Get.find<SceensControllers>().title.value="Astro Pro";
               break;
                case 3:
               Get.find<SceensControllers>().body=Two();
               Get.find<SceensControllers>().title.value="Two";
               break;
                case 4:
               Get.find<SceensControllers>().body=Three();
               Get.find<SceensControllers>().title.value="Three";
               break;
              default:
               Get.find<SceensControllers>().body=HomeScreen();
               Get.find<SceensControllers>().title.value="Four";
               break;
            }

             Get.find<SceensControllers>().update();
          },
          barBackgroundColor: Colors.purple,
          selectedIconColor: Colors.purple,
        ),

*/
