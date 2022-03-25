import "package:flutter/material.dart";
import "../drawer/drawer.dart";

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
      body: const SafeArea(
        child: Center(
          child: Text("Welcome"),
        ),
      ),
    );
  }
}
