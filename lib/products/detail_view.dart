import "package:flutter/material.dart";
import "./product_image.dart";
import "./product_info.dart";
import "./product_quantity.dart";
import "./reviews.dart";
import "./buy_button_group.dart";
import "./review_form.dart";
import "../app_routes.dart";

class DetailView extends StatefulWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
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

  @override
  Widget build(BuildContext context) {
    const String _imageUrl =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffECEFF1),
        iconTheme: const IconThemeData(color: Color(0xff263238)),
        title: const Text(
          "iPhone 13",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
          child: Column(
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
                      const ProductImage(),
                      const Divider(
                        thickness: 1.0,
                      ),
                      const ProductInfo(),
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
                            horizontal:
                                MediaQuery.of(context).size.width * 0.3,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context,AppRoutes.moreReviewsRoute);
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
                  child: const BuyButtonGroup(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
