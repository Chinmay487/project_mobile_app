import "package:flutter/material.dart";
import "./address_card.dart";
import "./user_title.dart";
import "./address_form.dart";
import "./shipping_status.dart";

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xff37474F)),
        title: const Text(
          "Your Profile",
          style: TextStyle(
            color: Color(0xff37474F),
          ),
        ),
        backgroundColor: const Color(0xffECEFF1),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: ListView(
            children: [
              UserTitle(title:"Your Addresses"),
              const AddressCard(),
              const AddressCard(),
              const Gap(),
              UserTitle(title:"Add New Address"),
              const AddressForm(),
              const Gap(),
              const SizedBox(height: 20.0,),
              UserTitle(title:"Shipping Status"),
              const ShippingStatus(),
            ],
          ),
        )
      ),
    );
  }
}

class Gap extends StatelessWidget {
  const Gap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 10.0,),
        Divider(thickness: 1.0,),
      ],
    );
  }
}

