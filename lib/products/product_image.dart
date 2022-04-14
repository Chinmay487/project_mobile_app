import "package:flutter/material.dart";


class ProductImage extends StatelessWidget {
    String? imageUrl;

  ProductImage({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      // flex: 2,
      child: Image.network(imageUrl!),
    );
  }
}