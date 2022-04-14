import "package:flutter/material.dart";
import "../button/button_outlined.dart";
import "./shipping_detail.dart";

class ShippingCard extends StatelessWidget {

  dynamic shippingInfo;
  String? status;
  ShippingCard({this.shippingInfo,this.status});

  @override
  Widget build(BuildContext context) {

    String paymentDate,total,city,deliveryDate;

    if(status == "pending"){
      paymentDate = shippingInfo["payment_date"].toString();
      total = shippingInfo["total"].toString();
      city = shippingInfo["shipping_address"]["city"];
      deliveryDate = "";
    } else {
      paymentDate = shippingInfo["user_info"]["payment_date"].toString();
      total = shippingInfo["user_info"]["total"].toString();
      city = shippingInfo["user_info"]["shipping_address"]["city"];
      deliveryDate = shippingInfo["delivery_date"].toString();
    }

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
                children: [
                  Text("Payment Date : $paymentDate"),
                  status == "pending" ? Container() : Text("Delivery Date : $deliveryDate"),
                  Text("Total : $total"),
                  Text("City : $city"),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            ButtonOutlined(
              displayText: "View More",
              onTapFunction: (){
                Navigator.push(context,MaterialPageRoute(
                  builder: (BuildContext context) => ShippingDetail(status: status,data: shippingInfo,)
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}



