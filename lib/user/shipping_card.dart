import "package:flutter/material.dart";
import "../button/button_outlined.dart";

class ShippingCard extends StatelessWidget {
  const ShippingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 0,
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      child: Card(
        color: const Color(0xffEEEEEE),
        elevation: 5,
        shadowColor: const Color(0xffCFD8DC),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Payment Date : 09/11/2022"),
                  Text("Delivery Date : 11/09/2023"),
                  Text("Total : 1234"),
                  Text("City : Mumbai"),
                  Text("Products : Laptop 3,iPhone 1,Watch 3"),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            ButtonOutlined(
              displayText: "View More",
              onTapFunction: (){},
            ),
          ],
        ),
      ),
    );
  }
}



