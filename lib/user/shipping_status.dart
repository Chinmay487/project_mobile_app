import "package:flutter/material.dart";
import "./shipping_button_group.dart";
import "./shipping_card.dart";

class ShippingStatus extends StatelessWidget {
  const ShippingStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ShippingButtonGroup(),
        const SizedBox(height: 20.0,),
        Column(
          children: const [
            ShippingCard(),
            ShippingCard(),
            ShippingCard(),
          ],
        )
      ],
    );
  }
}

