import "package:flutter/material.dart";
import "./address_card.dart";
import "./user_title.dart";
import "./address_form.dart";
import "./shipping_status.dart";
import "../api/user_info_api.dart";

class Profile extends StatefulWidget {
  // const Profile({Key? key}) : super(key: key);

  final String? idToken;
  Profile({this.idToken});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {



  void getData() async{
    print("Getting Data");
    dynamic data = await getUserCart(widget.idToken);
    if(data != null && data["addresses"].length > 0){

    }
    print(data);
  }

  @override
  void initState(){
    super.initState();
    getData();
  }



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
        margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: ListView(
          children: [
            UserTitle(title: "Your Addresses"),
            AddressCard(
              addressLine1: "Hehehe",
              addressLine2: "Huhuhu",
              city: "Lululu",
              district: "lelele",
              state: "nunun",
              pincode: "123456",
            ),
            AddressCard(
              addressLine1: "Hehehe",
              addressLine2: "Huhuhu",
              city: "Lululu",
              district: "lelele",
              state: "nunun",
              pincode: "123456",
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Divider(
              thickness: 1.0,
            ),
            UserTitle(title: "Add New Address"),
            const AddressForm(),
            const SizedBox(
              height: 10.0,
            ),
            const Divider(
              thickness: 1.0,
            ),
            const SizedBox(
              height: 20.0,
            ),
            UserTitle(title: "Shipping Status"),
            const ShippingStatus(),
          ],
        ),
      )),
    );
  }
}

