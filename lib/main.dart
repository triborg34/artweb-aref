import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forcomp/screens/mianviewscreen.dart';

import 'package:forcomp/util/bindigs.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.purple));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "For The Comp",
      debugShowCheckedModeBanner: false,
      initialBinding: Mybindings(),
      home: MainvaiewPage(),
    );
  }
}