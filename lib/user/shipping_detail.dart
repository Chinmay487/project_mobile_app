import "package:flutter/material.dart";

class ShippingDetail extends StatelessWidget {

  dynamic data;
  String? status;
  ShippingDetail({this.data,this.status});

  @override
  Widget build(BuildContext context) {
    // print(status);
    // print(data);

    const style1 = TextStyle(
      fontSize: 20,
    );

    const style2 = TextStyle(
      fontSize: 16,
    );

    String paymentId,total,line1,line2,city,district,state,pin,paymentDate,deliveryDate;
    List<Widget> products = [];

    if(status == "pending"){
      paymentId = data["payment_id"];
      paymentDate = data["payment_date"].toString();
      deliveryDate = "";
      total = data["total"].toString();
      line1 = data["shipping_address"]["line1"];
      line2 = data["shipping_address"]["line2"];
      city = data["shipping_address"]["city"];
      district = data["shipping_address"]["district"];
      state = data["shipping_address"]["state"];
      pin = data["shipping_address"]["pin"].toString();
      int counter = 1;
      for(var element in data["products"]){
        products.add(
          Text(
              "$counter. $element",
            style: style2,
          )
        );
        counter = counter + 1;
      }
    } else {
      paymentId = data["user_info"]["payment_id"];
      paymentDate = data["user_info"]["payment_date"].toString();
      deliveryDate = data["delivery_date"].toString();
      total = data["user_info"]["total"].toString();
      line1 = data["user_info"]["shipping_address"]["line1"];
      line2 = data["user_info"]["shipping_address"]["line2"];
      city = data["user_info"]["shipping_address"]["city"];
      district = data["user_info"]["shipping_address"]["district"];
      state = data["user_info"]["shipping_address"]["state"];
      pin = data["user_info"]["shipping_address"]["pin"].toString();
      int counter = 1;
      for(var element in data["user_info"]["products"]){
        products.add(
            Text("$counter. $element")
        );
        counter = counter + 1;
      }
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xff37474F)),
        title:  Text(
          status!,
          style: const TextStyle(
            color: Color(0xff37474F),
          ),
        ),
        backgroundColor: const Color(0xffECEFF1),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 20.0),
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                        "Your Products : ",
                      style: style1,
                    ),
                    ...products,
                  ],
                ),
              ),
              const Divider(thickness: 1.0,),
              const SizedBox(height: 15.0,),
              const Text("Payment Info",style: style1,),
              const SizedBox(height: 15.0,),
              Text("Total : $total",style: style2,),
              const SizedBox(height: 15.0,),
              Text("Payment Id : $paymentId",style: style2,),
              const SizedBox(height: 15.0,),
              Text("Payment date : $paymentDate",style: style2,),
              const SizedBox(height: 15.0,),
              status == "pending" ? Container() : Text("Delivery date : $deliveryDate",style: style2),
              const Divider(thickness: 1.0,),
              const SizedBox(height: 15.0,),
              const Text("Address Info : ",style: style1,),
              const SizedBox(height: 15.0,),
              Text(line1,style: style2,),
              Text(line2,style: style2,),
              Text(city,style: style2,),
              Text(district,style: style2,),
              Text(state,style: style2,),
              Text(pin,style: style2,),
              const SizedBox(height: 15.0,),
              const Divider(thickness: 1.0,),
            ],
          ),
        ),
      ),
    );
  }
}


