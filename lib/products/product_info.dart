import "package:flutter/material.dart";

class ProductInfo extends StatelessWidget {
  const ProductInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Price : 300",
          style: TextStyle(
            fontSize: 21,
            color: Color(0xff607D8B),
          ),
        ),
        Text(
          "Discount Price : 250",
          style: TextStyle(
            fontSize: 23,
            color: Color(0xff263238),
          ),
        ),
        // Text(
        //   "Quantity Available : 30",
        //   style: TextStyle(
        //     fontSize: 15,
        //     color: Colors.blueGrey,
        //   ),
        // ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo ducimus error nihil a tenetur eaque, facere doloremque veritatis at? Quidem.Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo ducimus error nihil a tenetur eaque, facere doloremque veritatis at? Quidem.",
        ),
      ],
    );
  }
}
