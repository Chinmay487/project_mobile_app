import "package:flutter/material.dart";
import "./shipping_button_group.dart";
import "./shipping_card.dart";
import "../api/payment_status_api.dart";

class ShippingStatus extends StatefulWidget {
  final String? idToken;
  ShippingStatus({this.idToken});

  @override
  State<ShippingStatus> createState() => _ShippingStatusState();
}

class _ShippingStatusState extends State<ShippingStatus> {
  String shippingStatus = "pending";
  List<Widget> status = [];
  bool fetchingData = true;

  void updateShippingStatus(String status) {
    setState(() {
      shippingStatus = status;
    });
    getShippingData();
  }

  void getShippingData() async {
    setState(() {
      fetchingData = true;
    });
    List<Widget> statusData = [];
    dynamic data =
        await getPaymentStatus(idToken: widget.idToken, status: shippingStatus);
    if (data != null) {
      if (data.length > 0) {
        for (var element in data) {
          statusData.add(ShippingCard(
            status: shippingStatus,
            shippingInfo: element,
          ));
        }
      } else {
        statusData.add(Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0),
          child: const Center(
            child: Text("Nothing Here"),
          ),
        ));
      }
    }
    setState(() {
      status = statusData;
      fetchingData = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getShippingData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShippingButtonGroup(
          onPendingPress: shippingStatus == "pending"
              ? null
              : () {
                  updateShippingStatus("pending");
                },
          onDeliveredPress: shippingStatus == "delivered"
              ? null
              : () {
                  updateShippingStatus("delivered");
                },
          onDispatchPress: shippingStatus == "dispatched"
              ? null
              : () {
                  updateShippingStatus("dispatched");
                },
        ),
        const SizedBox(
          height: 20.0,
        ),
        fetchingData
            ? Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const[
                    Text("Fetching..."),
                    CircularProgressIndicator(),
                  ],
                ),
              )
            : Column(
                children: status,
              )
      ],
    );
  }
}
