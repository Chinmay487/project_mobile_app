import "package:flutter/material.dart";


class DrawerElement extends StatelessWidget {
  // const DrawerElement({Key? key}) : super(key: key);

  final String? category;
  final dynamic onTapFunction;
  // final String?

  DrawerElement({this.category="",this.onTapFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 0),
      child: GestureDetector(
        onTap: onTapFunction,
        child:Text(
            category!,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
