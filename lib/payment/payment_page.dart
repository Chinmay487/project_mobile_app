import "package:flutter/material.dart";

class PaymentPage extends StatefulWidget {

  final String? idToken;

  PaymentPage({this.idToken});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String url = "";
  bool fetchStatus = false;
  double progress = 0;

  @override
  void initState() {
    super.initState();
  }

  Widget FetchedData(){
    if(fetchStatus){
      return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const[
            Text("Please Wait..."),
            CircularProgressIndicator(),
          ],
        ),
      );
    }
    return Container(
      child: Center(
        child: Text("Done"),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FetchedData(),
        ),
      ),
    );
  }
}


