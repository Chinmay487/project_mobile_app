import "package:flutter/material.dart";
import "./product_image.dart";
import "./product_info.dart";
import "./product_quantity.dart";
import "./reviews.dart";

class DetailView extends StatefulWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {

  int _quantity = 1;

  void _increment(){
    setState(() {
      _quantity+=1;
    });
  }

  void _decrement(){
    setState(() {
      if(_quantity > 0){
        _quantity -= 1;
      }
      if(_quantity == 0){
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
            child:
              Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 15.0),
                      child: ListView(
                        children: [
                          const ProductImage(),
                          const Divider(thickness: 1.0,),
                          const ProductInfo(),
                          const SizedBox(
                            height: 20,
                          ),
                          ProductQuantity(
                            incrementFunction: _increment,
                            decrementFunction: _decrement,
                            quantity: _quantity,
                          ),
                          const Divider(thickness: 2.0,),

                          Reviews(),
                        ],
                      ),
                    ),
                  ),
                  const Divider(thickness: 2.0,),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text("Buy Now"),
                        ),
                        SizedBox(width: 30.0,),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text("Add To Cart"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}













