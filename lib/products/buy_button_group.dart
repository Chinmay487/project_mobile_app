import "package:flutter/material.dart";
import "../app_routes.dart";

class BuyButtonGroup extends StatelessWidget {
  const BuyButtonGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context,AppRoutes.cartPageroute);
            },
            child: const Text("Buy Now"),
          ),
          const SizedBox(width: 30.0,),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Add To Cart"),
          ),
        ],
      ),
    );
  }
}