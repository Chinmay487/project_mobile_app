import "package:flutter/material.dart";
import "./product_quantity.dart";
import "./detail_view.dart";
import "../api/user_info_api.dart";
import "package:provider/provider.dart";
import "../authentication/google_app_auth.dart";

class ProductCard extends StatefulWidget {

  final bool isCart;
  final String? thumbnail;
  final String? title;
  final int? price;
  final String? uniqueKey;
  final String? category;
  final dynamic onQuantityChange;
  final int? quantity;
  final int? productIndex;
  final dynamic onElementRemove;
  int? productQuantity=1;

  ProductCard(
      {this.isCart = false,
      this.thumbnail,
      this.title,
      this.price,
      this.uniqueKey,
      this.category,
      this.onQuantityChange,
        this.onElementRemove,
      this.quantity = 1,
      this.productIndex = 0});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  @override
  void initState(){
    super.initState();
    widget.productQuantity = widget.quantity;
  }


  Widget getCardOptions(BuildContext context) {
    if (widget.isCart) {
      String userToken = Provider.of<GoogleSignInProvider>(context).idToken;
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            splashRadius: 20,
            onPressed: (){widget.onElementRemove(elementIndex : widget.productIndex!,price:widget.price);},
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
          QuantityList(
            selectedQuantity: widget.productQuantity,
            onQtyChangeFunction: (value) async{
              setState(() {
                widget.productQuantity = value;
              });

              dynamic result = await updateProductQuantity(
                  idToken:userToken,
                  category: widget.category,
                  quantity: widget.productQuantity,
                  price: widget.price,
                  index: widget.productIndex,
                  uniqueKey:widget.uniqueKey);
              widget.onQuantityChange();
            },
          ),
        ],
      );
    }
    return ViewDetailButton(
      category: widget.category,
      uniqueKey: widget.uniqueKey,
      productTitle: widget.title!,
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
                child: Image.network(widget.thumbnail!),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title!,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xff263238),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    " \u{20B9} ${widget.price!}",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xff263238),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: getCardOptions(context),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewDetailButton extends StatelessWidget {
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

