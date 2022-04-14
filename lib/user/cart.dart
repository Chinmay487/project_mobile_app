import "package:flutter/material.dart";
import "./user_title.dart";
import "./address_card.dart";
import "../payment/payment_info.dart";
import "../products/product_card.dart";
import "../api/user_info_api.dart";
import "../api/payment_info_api.dart";
import 'package:razorpay_flutter/razorpay_flutter.dart';
import "package:provider/provider.dart";
import "../authentication/google_app_auth.dart";

class Cart extends StatefulWidget {
  final String? idToken;

  Cart({this.idToken});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  late var _razorpay;

  bool isDataFetched = true;
  bool noCart = false;
  List<Widget> productCartList = [];
  List<dynamic> addresses = [];
  double? subTotal = 0;
  double? charges = 0;
  double? total = 0;
  List<Widget> addressList = [];
  bool isAddressAvailable = false;
  List<dynamic> indexListOfAddress = [];
  int selectedAddressIndex = 1;

  void getUserBill() async {
    dynamic result = await getAmount(idToken: widget.idToken);
    if (result != null) {
      setState(() {
        subTotal = result["subTotal"].toDouble();
        charges = result["charges"].toDouble();
        total = result["total"].toDouble();
      });
    }
  }

  void onElementRemoval({int? elementIndex, int? price}) {
    setState(() {
      isDataFetched = true;
      productCartList.remove(productCartList[elementIndex!]);
    });
    removeFromCart(
        index: elementIndex!, idToken: widget.idToken, price: price!);
    getData();
  }

  void getCart() async {
    const url =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc";
    List<Widget> cartList = [];
    var userCart = await getUserCartInfo(widget.idToken);
    int counter = 0;
    for (var element in userCart) {
      cartList.add(
        ProductCard(
          isCart: true,
          thumbnail: url,
          price: element["discount_price"],
          title: element["title"],
          uniqueKey: element["key"],
          category: element["category"],
          quantity: int.parse(element["quantity"].toString()),
          productIndex: counter,
          onQuantityChange: getUserBill,
          onElementRemove: onElementRemoval,
        ),
      );
      counter += 1;
    }
    setState(() {
      productCartList = cartList;
    });
  }

  void getData() async {
    var data = await getUserCart(widget.idToken);
    setState(() {
      isDataFetched = true;
      total = 0;
      subTotal = 0;
      charges = 0;
    });
    if (data != null) {
      if (data["addresses"].length > 0) {
        List<Widget> listOfAddress = [];
        List<dynamic> indexOfAddress = [];
        int counter = 0;
        for (var address in data["addresses"]) {
          indexOfAddress
              .add({"title": "Address${counter + 1}", "index": counter});
          counter = counter + 1;
          listOfAddress.add(AddressCard(
            isProfile: false,
            addressLine1: address["line1"],
            addressLine2: address["line2"],
            city: address["city"],
            district: address["district"],
            state: address["state"],
            pincode: address["pin"].toString(),
          ));
        }
        setState(() {
          selectedAddressIndex = 0;
          isAddressAvailable = true;
          addressList = listOfAddress;
          indexListOfAddress = indexOfAddress;
        });
      }

      if (data["cart"].length > 0) {
        getCart();
        getUserBill();
      }
    }
    setState(() {
      noCart = !(data["cart"].length > 0);
      isDataFetched = false;
      addresses = data["addresses"];
    });
  }

  void updateIndex(value) {
    setState(() {
      selectedAddressIndex = value;
    });
  }

  void onPaymentSuccess(String? paymentId) async {
    await paymentSuccess(
        idToken: widget.idToken,
        paymentId: paymentId,
        addressIndex: selectedAddressIndex);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    onPaymentSuccess(response.paymentId);
    getData();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("Payment Fail");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  @override
  void initState() {
    super.initState();
    getData();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void confirmPayment({String? name, String? email}) async {
    dynamic data = await getPaymentKeys(idToken: widget.idToken);
    if(data != null){
      String apiKey = data["api_key"];
      String apiSecrete = data["api_secrete"];
      dynamic options = {
        "key": apiKey,
        "key_secrete": apiSecrete,
        "amount": (total! * 100).toString(),
        "currency": "INR",
        "name": name,
        "description": "Shopping With ShopHeaven",
        'timeout': 300,
        "prefill": {"email": email}
      };
      _razorpay.open(options);
    }

  }

  Widget isDataAvailable({dynamic name, dynamic email}) {
    if (isDataFetched) {
      return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Please Wait..."),
            SizedBox(
              width: 15.0,
            ),
            CircularProgressIndicator()
          ],
        ),
      );
    }
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 15.0, 0, 0),
      child: ListView(
        children: [
          UserTitle(title: "Payment Info"),
          PaymentInfo(
            total: total!,
            subTotal: subTotal!,
            charges: charges!,
            onTapFunction: (isAddressAvailable && productCartList.length > 0)
                ? () {
                    confirmPayment(name: name, email: email);
                  }
                : null,
          ),
          const SizedBox(
            height: 20,
          ),
          (isAddressAvailable && productCartList.isNotEmpty)
              ? Container()
              : const Center(
                  child: Text("Please Add Something to cart"),
                ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            thickness: 1.0,
          ),
          const SizedBox(
            height: 20.0,
          ),
          UserTitle(title: "Shipping Address"),
          isAddressAvailable
              ? Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // SizedBox(height: 20.0,),
                          const Text("Shipping Address : "),
                          const SizedBox(
                            width: 20.0,
                          ),
                          DropdownButton(
                            value: selectedAddressIndex,
                            items: indexListOfAddress.map((item) {
                              return DropdownMenuItem(
                                child: Text(item["title"]),
                                value: item["index"],
                              );
                            }).toList(),
                            onChanged: (value) {
                              updateIndex(value);
                            },
                          )
                        ],
                      ),
                    ),
                    addressList[selectedAddressIndex],
                  ],
                )
              : Container(
                  alignment: Alignment.center,
                  child: const Text("No Address available"),
                ),
          const Divider(
            thickness: 1.0,
          ),
          const SizedBox(
            height: 20.0,
          ),
          UserTitle(title: "Your Products"),
          const SizedBox(
            height: 30.0,
          ),
          !(noCart)
              ? CartList(
                  productCartList: productCartList,
                )
              : const Center(
                  child: Text(
                    "Nothing Added to cart",
                  ),
                )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String name = Provider.of<GoogleSignInProvider>(context).name;
    String email = Provider.of<GoogleSignInProvider>(context).email;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xff37474F)),
        title: const Text(
          "Your Cart",
          style: TextStyle(
            color: Color(0xff37474F),
          ),
        ),
        backgroundColor: const Color(0xffECEFF1),
      ),
      body: SafeArea(
        child: isDataAvailable(name: name, email: email),
      ),
    );
  }
}

class CartList extends StatelessWidget {
  // const CartList({Key? key}) : super(key: key);

  final List<Widget>? productCartList;

  CartList({this.productCartList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: productCartList!,
    );
  }
}

class AddressSelector extends StatelessWidget {
  // const AddressSelector({Key? key}) : super(key: key);
  final List<dynamic>? indexOfAddress;

  AddressSelector({this.indexOfAddress});

  @override
  Widget build(BuildContext context) {
    List<dynamic> addrs = [
      {"title": "Address 1", "index": 0},
      {"title": "Address 2", "index": 1}
    ];

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(height: 20.0,),
          const Text("Shipping Address : "),
          const SizedBox(
            width: 20.0,
          ),
          DropdownButton(
            value: addrs[0]["index"],
            items: addrs.map((item) {
              return DropdownMenuItem(
                child: Text(item["title"]),
                value: item["index"],
              );
            }).toList(),
            onChanged: (value) {
              print(value);
            },
          )
        ],
      ),
    );
  }
}
