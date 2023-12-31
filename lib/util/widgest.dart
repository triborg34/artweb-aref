import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SearchBar extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100),
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(30),
                topRight: Radius.circular(30))),
        height: 50,
        width:Get.width,
        child: Center(
          child: TextField(
            
            onSubmitted: (text) {
              
            },
            cursorColor: Colors.purpleAccent,
            cursorHeight: 20,
            expands: false,
            textDirection: TextDirection.rtl,
            style: TextStyle(
                color: Colors.grey.shade700, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
                label: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "جستجو...",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ),

                // hintText: "جستجو...",
                hintTextDirection: TextDirection.rtl,
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 0, style: BorderStyle.none))),
          ),
        ),
      ),
      CircleAvatar(
        child: Icon(
          Icons.search,
          color: Color.fromARGB(255, 255, 255, 255),
          size: 28,
        ),
        radius: 25,
        backgroundColor: Colors.purple,
      ),
    ]);
  }
}
