import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import "./product_image.dart";
import "./product_info.dart";
import "./product_quantity.dart";
import "./reviews.dart";
import "./buy_button_group.dart";
import "./review_form.dart";
import "../api/detail_view_api.dart";
import "./more_reviews.dart";
import "package:provider/provider.dart";
import "../authentication/google_app_auth.dart";
import "../user/cart.dart";

class DetailView extends StatefulWidget {
  // const DetailView({Key? key}) : super(key: key);

  final String? category;
  final String? uniqueKey;
  final String? productTitle;

  DetailView({this.category, this.uniqueKey, this.productTitle});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  String? imageUrl;
  String? productTitle;
  int? price;
  int? discountPrice;
  String? description;

  bool fetchDataStatus = false;
  bool addProductToCartStatus = false;

  int _quantity = 1;

  void getData() async {
    setState(() {
      fetchDataStatus = true;
    });
    dynamic data = await getProductDetail(
        category: widget.category, uniqueKey: widget.uniqueKey);
    const url =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc";

    if (data != null) {
      setState(() {
        fetchDataStatus = false;
        imageUrl = url; //data["images"][0];
        productTitle = data["title"];
        price = data["price"];
        discountPrice = data["discount_price"];
        description = data["description"];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  void navigateToReviews(BuildContext context) {
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => MoreReviews(
          category: widget.category,
          uniqueKey: widget.uniqueKey,
        ),
      ),
    );
  }

  void makePurchase ({String? idToken,bool? doNavigate}) async {
    setState(() {
      addProductToCartStatus = true;
    });
    final provider = Provider.of<GoogleSignInProvider>(
        context,
        listen: false);
    provider.getUpdatedIdToken();
    final result = await addProductToCart(
      idToken: idToken,
      category: widget.category,
      productKey: widget.uniqueKey,
      quantity: _quantity,
      price: discountPrice,
    );
    setState(() {
      _quantity = 1;
      addProductToCartStatus = false;
    });
    if (result != null) {
      if(doNavigate!){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) =>
                Cart(idToken: idToken),
          ),
        );
      } else {
        var alertDialog = AlertDialog(
          title: const Text("Purchase"),
          content: const Text("Product Added to Your Cart"),
          actions: <Widget>[
            TextButton(
              child: const Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
        showDialog(
          context : context,
          barrierDismissible: false,
          builder: (BuildContext context){
            return alertDialog;
          }
        );
      }

    } else {
      var provider = Provider.of<GoogleSignInProvider>(
          context,
          listen: false);
      provider.logoutUser();
    }
  }
  Widget isDataFetched(idToken) {
    if (!fetchDataStatus) {
      return Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 15.0,
              ),
              child: ListView(
                children: [
                  ProductImage(
                    imageUrl: imageUrl,
                  ),
                  const Divider(
                    thickness: 1.0,
                  ),
                  ProductInfo(
                    price: price,
                    discountPrice: discountPrice,
                    description: description,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Select Quantity : "),
                      QuantityList(
                        selectedQuantity: _quantity,
                        onQtyChangeFunction: (value) {
                          setState(() {
                            _quantity = value;
                          });
                        },
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 2.0,
                  ),
                  const Reviews(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: MediaQuery.of(context).size.width * 0.3,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        navigateToReviews(context);
                      },
                      child: const Text(
                        "View More",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    thickness: 1.0,
                  ),
                  const UserReviewForm(),
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 1.0,
          ),
          Expanded(
            flex: 0,
            child: idToken == null
                ? Container(
                    alignment: Alignment.center,
                    child: const Text("Please Login To Purchase"),
                  )
                : addProductToCartStatus
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Please Wait..."),
                          SizedBox(
                            width: 15.0,
                          ),
                          CircularProgressIndicator()
                        ],
                      )
                    : BuyButtonGroup(
                        buyNow: (){
                          makePurchase(idToken : idToken,doNavigate : true);
                        },
                        addToCart: (){
                          makePurchase(idToken : idToken,doNavigate : false);
                        },
                      ),
          ),
        ],
      );
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Please Wait",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            width: 25.0,
          ),
          CircularProgressIndicator()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var idToken =
        Provider.of<GoogleSignInProvider>(context, listen: true).idToken;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffECEFF1),
        iconTheme: const IconThemeData(color: Color(0xff263238)),
        title: Text(
          widget.productTitle!,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // drawer: const MyDrawer(),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
          child: isDataFetched(idToken),
        ),
      ),
    );
  }
}
