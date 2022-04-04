import "package:flutter/material.dart";
import "../app_routes.dart";

class BuyButtonGroup extends StatelessWidget {
  // const BuyButtonGroup({Key? key}) : super(key: key);

  final dynamic buyNow,addToCart;

  BuyButtonGroup({this.buyNow,this.addToCart});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: buyNow,
            child: const Text("Buy Now"),
          ),
          const SizedBox(width: 30.0,),
          ElevatedButton(
            onPressed: addToCart,
            child: const Text("Add To Cart"),
          ),
        ],
      ),
    );
  }
}