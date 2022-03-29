import "package:flutter/material.dart";
import "./user_title.dart";
import "./address_card.dart";
import "../payment/payment_info.dart";
import "../products/product_card.dart";

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xff37474F)),
        title: const Text(
          "Your Cart",
          style: TextStyle(
            color: Color(0xff37474F),
          ),
        ),
        backgroundColor: const Color(0xffECEFF1),
      ),
      body:SafeArea(
        child: Container(
          margin:const EdgeInsets.fromLTRB(0, 15.0, 0, 0),
          child: ListView(
            children: [
              UserTitle(title:"Payment Info"),
              const PaymentInfo(),
              const SizedBox(height: 20,),
              const Divider(thickness: 1.0,),
              const SizedBox(height: 20.0,),
              UserTitle(title:"Shipping Address"),
              AddressCard(isProfile: false,),
              const Divider(thickness: 1.0,),
              const SizedBox(height: 20.0,),
              UserTitle(title:"Your Products"),
              const CartList(),
            ],
          ),
        )
      ),
    );
  }
}

class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductCard(
          isCart: true,
        ),
        ProductCard(
          isCart: true,
        ),
        ProductCard(
          isCart: true,
        ),
        ProductCard(
          isCart: true,
        ),
      ],
    );
  }
}


