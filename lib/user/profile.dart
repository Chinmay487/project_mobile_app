import "package:flutter/material.dart";
import "./address_card.dart";
import "./user_title.dart";
import "./address_form.dart";
import "./shipping_status.dart";
import "../api/user_info_api.dart";

class Profile extends StatefulWidget {
  final String? idToken;
  Profile({this.idToken});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool fetchAddress = false;
  List<Widget> listOfAddresses = [];

  void getData() async {
    List<Widget> addressList = [];
    setState(() {
      fetchAddress = true;
    });
    dynamic data = await getUserCart(widget.idToken);
    if (data != null && data["addresses"].length > 0) {
      int counter = 0;
      for (dynamic element in data["addresses"]) {
        addressList.add(AddressCard(
          addressLine1: element["line1"],
          addressLine2: element["line2"],
          city: element["city"],
          district: element["district"],
          state: element["state"],
          pincode: element["pin"],
          onDeleteCall: onAddressDelete,
          index: counter,
        ));
        counter = counter + 1;
      }
    }
    setState(() {
      listOfAddresses = addressList;
      fetchAddress = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  void onAddressDelete(index) async {
    await removeAddress(idToken: widget.idToken, index: index);
    getData();
  }

  List<Widget> fetchingAddress() {
    if (fetchAddress) {
      return [
        Center(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Please Wait"),
                SizedBox(
                  width: 20.0,
                ),
                CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      ];
    }
    List<Widget> dataToReturn = [];

    if (!fetchAddress && listOfAddresses.isNotEmpty) {
      dataToReturn = listOfAddresses;
    } else {
      dataToReturn.add(Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0),
        child: const Center(child: Text("No Address Added")),
      ));
    }
    return dataToReturn;
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
            const SizedBox(
              height: 15.0,
            ),
            UserTitle(
              title: "NOTE : You can add max 2 addresses",
            ),
            ...fetchingAddress(),
            const SizedBox(
              height: 10.0,
            ),
            const Divider(
              thickness: 1.0,
            ),
            UserTitle(title: "Add New Address"),
            AddressForm(
              idToken: widget.idToken,
              afterFormSubmit: getData,
              lengthOfAddress: (listOfAddresses.length < 2),
            ),
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
            ShippingStatus(idToken: widget.idToken,),
          ],
        ),
      )),
    );
  }
}
