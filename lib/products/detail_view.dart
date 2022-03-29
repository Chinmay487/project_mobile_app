import "package:flutter/material.dart";
import "./product_image.dart";
import "./product_info.dart";
import "./product_quantity.dart";
import "./reviews.dart";
import "./buy_button_group.dart";
import "./review_form.dart";
import "../app_routes.dart";
import "../api/detail_view_api.dart";
import "./more_reviews.dart";

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

  int _quantity = 1;

  void _increment() {
    setState(() {
      _quantity += 1;
    });
  }

  void _decrement() {
    setState(() {
      if (_quantity > 0) {
        _quantity -= 1;
      }
      if (_quantity == 0) {
        _quantity = 1;
      }
    });
  }

  void getData() async {
    setState(() {
      fetchDataStatus = true;
    });
    dynamic data = await getProductDetail(
        category: widget.category, uniqueKey: widget.uniqueKey);
    if (data != null) {
      setState(() {
        fetchDataStatus = false;
        imageUrl = data["images"][0];
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

  Widget isDataFetched() {
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
                  ProductQuantity(
                    incrementFunction: _increment,
                    decrementFunction: _decrement,
                    quantity: _quantity,
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
          const Expanded(
            flex: 0,
            child: BuyButtonGroup(),
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
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
          child: isDataFetched(),
        ),
      ),
    );
  }
}
