import "package:flutter/material.dart";

class ProductInfo extends StatelessWidget {

  final String? description;
  final int? price;
  final int? discountPrice;

  ProductInfo({this.description,this.price,this.discountPrice});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          "Discount Price : \u{20B9} ${discountPrice!}",
          style: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Color(0xff263238),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "MRP : \u{20B9} ${price!}",
          style: const TextStyle(
            fontSize: 18,
            decoration: TextDecoration.lineThrough,
            color: Color(0xff607D8B),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          description!,
        ),
      ],
    );
  }
}
