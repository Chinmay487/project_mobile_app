import "package:flutter/material.dart";
import "./product_card.dart";

class ProductList extends StatelessWidget {
  // const ProductList({Key? key}) : super(key: key);

  final String? category;

  ProductList({this.category});

  @override
  Widget build(BuildContext context) {



    return Container(
      margin: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 2,
      ),
      child: Column(
        children:[
          Text(
              category!,
            style: TextStyle(
              fontSize: 25,
              color: Color(0xff263238),
              fontWeight: FontWeight.bold,
            ),
          ),
          ProductCard(),
          ProductCard(),
          ProductCard(),
          ProductCard(),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff2196F3)),
            ),
              onPressed: (){},
              child: const Text(
                  "View More",
                style: TextStyle(
                  color: Color(0xffFAFAFA)
                ),
              ),
          )
        ],
      ),
    );
  }
}
