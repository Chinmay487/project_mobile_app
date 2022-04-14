import "package:flutter/material.dart";
import "../button/button_outlined.dart";

class PaymentInfo extends StatelessWidget {
  final double? total;
  final double? charges;
  final double? subTotal;
  final dynamic? onTapFunction;

  PaymentInfo({this.total,this.charges,this.subTotal,this.onTapFunction});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: MediaQuery.of(context).size.width * 0.09,
      ),
      child: SizedBox(
        // width: MediaQuery.of(context).size.width * 0.5,
        child: Card(
          color: const Color(0xffEEEEEE),
          elevation: 5,
          shadowColor: const Color(0xffCFD8DC),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BillingInfo(
                  label: "Subtotal",
                  displayNumber: subTotal!,
                ),
                BillingInfo(
                  label: "Shipping Charges",
                  displayNumber: charges!,
                ),
                BillingInfo(
                  label: "Total",
                  displayNumber: total!,
                ),
                ButtonOutlined(
                  displayText: "Order Now",
                  onTapFunction: onTapFunction,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BillingInfo extends StatelessWidget {
  // const BillingInfo({Key? key}) : super(key: key);

  final double? displayNumber;
  final String? label;

  BillingInfo({this.displayNumber, this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      child: Text(
        "${label!} : ${displayNumber!}",
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}
