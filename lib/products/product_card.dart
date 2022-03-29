import "package:flutter/material.dart";
import "../app_routes.dart";
import "./product_quantity.dart";
import "./detail_view.dart";

class ProductCard extends StatelessWidget {
  // const ProductCard({Key? key}) : super(key: key);

  final bool isCart;
  final String? thumbnail;
  final String? title;
  final int? price;
  final String? uniqueKey;
  final String? category;

  ProductCard(
      {this.isCart = false,
      this.thumbnail,
      this.title,
      this.price,
      this.uniqueKey,
      this.category});

  Widget getCardOptions(BuildContext context) {
    if (isCart) {
      return const CartActions();
    }
    return ViewDetailButton(
      category: category,
      uniqueKey: uniqueKey,
      productTitle: title!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.18,
      child: Card(
        elevation: 4,
        shadowColor: const Color(0xffECEFF1),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  image: NetworkImage(thumbnail!),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title!,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xff263238),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    " \u{20B9} ${price!}",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xff263238),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getCardOptions(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewDetailButton extends StatelessWidget {
  // const ViewDetailButton({Key? key}) : super(key: key);

  final String? category;
  final String? uniqueKey;
  final String? productTitle;

  ViewDetailButton({this.category, this.uniqueKey, this.productTitle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: const Color(0xffCFD8DC),
      splashColor: const Color(0xff4FC3F7),
      onTap: () {
        // Navigator.pushNamed(context, AppRoutes.detailViewRoute);
        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => DetailView(
              category: category,
              uniqueKey: uniqueKey,
              productTitle: productTitle!,
            ),
          ),
        );
      },
      child: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          "View",
          style: TextStyle(
            color: Color(0xff42A5F5),
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }
}

class CartActions extends StatelessWidget {
  const CartActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          splashRadius: 20,
          onPressed: () {},
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
        ProductQuantity(
          incrementFunction: () {},
          decrementFunction: () {},
          quantity: 1,
          isCart: true,
        )
      ],
    );
  }
}
