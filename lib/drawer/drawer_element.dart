import "package:flutter/material.dart";


class DrawerElement extends StatelessWidget {
  // const DrawerElement({Key? key}) : super(key: key);

  final String? category;
  // final String?

  DrawerElement({this.category:""});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 0),
      child: GestureDetector(
        onTap: (){},
        child:Text(
            category!,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
