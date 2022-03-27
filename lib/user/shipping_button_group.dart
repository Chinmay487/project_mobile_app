import "package:flutter/material.dart";

class ShippingButtonGroup extends StatelessWidget {
  const ShippingButtonGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ShippingStatusButton(
          buttonText: "Pending",
          onButtonPress: (){},
        ),
        ShippingStatusButton(
          buttonText: "Dispatched",
          onButtonPress: (){},
        ),
        ShippingStatusButton(
          buttonText: "Delivered",
          onButtonPress: (){},
        ),
      ],
    );
  }
}

class ShippingStatusButton extends StatelessWidget {
  // const ShippingStatusButton({Key? key}) : super(key: key);

  final dynamic onButtonPress;
  final String? buttonText;

  ShippingStatusButton({this.onButtonPress,this.buttonText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onButtonPress,
      child:Text(buttonText!),
    );
  }
}

