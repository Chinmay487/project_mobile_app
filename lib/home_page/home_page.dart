import "package:flutter/material.dart";
import "../drawer/drawer.dart";
import "../products/product_list.dart";




class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xff37474F)),
        title: const Text(
          "ShopHeaven",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),

        backgroundColor: const Color(0xffECEFF1),
      ),
      drawer: const MyDrawer(),
      body:  SafeArea(
        child: ListView(
          cacheExtent: 9999,
          children: [
            ProductList(category: "laptop",),
            ProductList(category: "iPhone",),
            ProductList(category: "Camera",),
            ProductList(category: "Clock",),
            ProductList(category: "Watch",)
          ],
        ),
      ),
    );
  }
}
