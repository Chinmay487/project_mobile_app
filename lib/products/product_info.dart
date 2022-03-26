import "package:flutter/material.dart";

class ProductInfo extends StatelessWidget {
  const ProductInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(
          height: 10,
        ),
        Text(
          "Discount Price : \u{20B9} 250",
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Color(0xff263238),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "MRP : \u{20B9} 300",
          style: TextStyle(
            fontSize: 18,
            decoration: TextDecoration.lineThrough,
            color: Color(0xff607D8B),
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
