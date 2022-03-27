import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';

class ProductQuantity extends StatelessWidget {
  // const ProductQuantity({Key? key}) : super(key: key);

  final dynamic incrementFunction;
  final dynamic decrementFunction;
  final int? quantity;

  ProductQuantity(
      {this.incrementFunction, this.decrementFunction, this.quantity});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.bottomRight,
                child: const Text(
                  "Quantity : ",
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xff37474F),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  QuantityButton(
                    tapFunction: incrementFunction,
                    buttonIcon: Icons.add,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("$quantity",
                      style: const TextStyle(
                        fontSize: 18,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  QuantityButton(
                    tapFunction: decrementFunction,
                    buttonIcon: Icons.remove,
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class QuantityButton extends StatelessWidget {
  final dynamic? buttonIcon;
  final dynamic? tapFunction;

  QuantityButton({this.buttonIcon, this.tapFunction});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xff42A5F5),
      borderRadius: BorderRadius.circular(5.0),
      child: InkWell(
        onTap: tapFunction,
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            child: Icon(
              buttonIcon,
              color: Colors.white,
            )),
      ),
    );
  }
}
