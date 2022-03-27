import "package:flutter/material.dart";
import 'package:flutter/painting.dart';
import "../button/button_outlined.dart";

class PaymentInfo extends StatelessWidget {
  const PaymentInfo({Key? key}) : super(key: key);

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
            height: MediaQuery.of(context).size.height*0.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2,horizontal: 4),
                  child: Row(
                    children: [
                      Text("Shipping Address : "),
                      Expanded(
                          child:DropdownButton(
                            items: <String>["Address 1","Address 2"]
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value){
                              print(value);
                            },
                          ),
                      ),
                    ],
                  ),
                ),
                BillingInfo(
                  label: "Subtotal",
                  displayNumber: 100,
                ),
                BillingInfo(
                  label: "Shipping Charges",
                  displayNumber: 50,
                ),
                BillingInfo(
                  label: "Total",
                  displayNumber: 150,
                ),
                ButtonOutlined(
                  displayText: "Order Now",
                  onTapFunction: () {},
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

  final int? displayNumber;
  final String? label;

  BillingInfo({this.displayNumber,this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 10),
      child: Text(
        "${label!} : ${displayNumber!}",
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}
