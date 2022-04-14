import "package:flutter/material.dart";

class ShippingButtonGroup extends StatelessWidget {
  // const ShippingButtonGroup({Key? key}) : super(key: key);

  final dynamic onPendingPress,onDispatchPress,onDeliveredPress;

  ShippingButtonGroup({this.onDeliveredPress,this.onDispatchPress,this.onPendingPress});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ShippingStatusButton(
          buttonText: "Pending",
          onButtonPress: onPendingPress,
        ),
        ShippingStatusButton(
          buttonText: "Dispatched",
          onButtonPress: onDispatchPress,
        ),
        ShippingStatusButton(
          buttonText: "Delivered",
          onButtonPress: onDeliveredPress,
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

