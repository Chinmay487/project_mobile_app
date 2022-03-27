import "package:flutter/material.dart";

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
            const ViewMoreButton(),
          ],
        ),
      ),
    );
  }
}


class ViewMoreButton extends StatelessWidget {
  const ViewMoreButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: const Color(0xffB3E5FC),
          onTap: (){},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              child: const Text(
                "View More",
                style: TextStyle(
                  color:Color(0xff1976D2),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

