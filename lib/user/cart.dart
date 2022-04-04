import "package:flutter/material.dart";
import "./user_title.dart";
import "./address_card.dart";
import "../payment/payment_info.dart";
import "../products/product_card.dart";
import "../api/user_info_api.dart";

class Cart extends StatefulWidget {
  // const Cart({Key? key}) : super(key: key);

  final String? idToken;

  Cart({this.idToken});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool isDataFetched = true;
  bool noCart = false;
  List<Widget> productCartList = [];
  List<dynamic> addresses = [];
  double? subTotal = 0;
  double? charges = 0;
  double? total=0;



  void getUserBill() async{
    dynamic result = await getAmount( idToken: widget.idToken );
    if(result != null){
      setState(() {
        subTotal = result["subTotal"].toDouble();
        charges = result["charges"].toDouble();
        total = result["total"].toDouble();
      });
    }
  }

  void onElementRemoval({int? elementIndex,int? price}){
    setState(() {
      productCartList.remove(productCartList[elementIndex!]);
    });
    removeFromCart(index:elementIndex!,idToken:widget.idToken,price: price!);
    getData();
  }

  void getCart() async{
    const url = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc";
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
    });
    if (data != null) {
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

  @override
  void initState() {
    super.initState();
    getData();
  }

  Widget isDataAvailable() {
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
          PaymentInfo(total: total!,subTotal: subTotal!,charges: charges!,),
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
          AddressCard(
            isProfile: false,
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
        child: isDataAvailable(),
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
