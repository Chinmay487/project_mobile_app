import "package:flutter/material.dart";


class ProductImage extends StatelessWidget {
  const ProductImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String _imageUrl =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc";
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      // flex: 2,
      child: const Image(
        image: NetworkImage(_imageUrl),
      ),
    );
  }
}