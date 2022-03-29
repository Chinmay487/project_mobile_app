import 'package:basic_utils/basic_utils.dart';
import "package:flutter/material.dart";
import "./product_card.dart";
import "../api/home_page_api.dart";
import "../category/category_view.dart";

class ProductList extends StatefulWidget {
  // const ProductList({Key? key}) : super(key: key);

  final String? category;
  ProductList({this.category});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Widget> productCardList = [];
  bool fetchDataStatus = false;

  void fetchData() async {
    setState((){
      fetchDataStatus = true;
    });
    var data = await getHomePageCategories(category: widget.category);
    List<Widget> productList = [];
    if(data != null){
      for(var element in data){
        productList.add(
            ProductCard(
              title: element["title"],
              thumbnail: element["thumbnail"],
              price: element["price"],
              uniqueKey: element["key"],
              category: widget.category,
            )
        );
      }
    } else {
      productList.add(
        const Center(
          child:Text("Nothing In Here"),
        ),
      );
    }
    setState(() {
      productCardList = productList;
      fetchDataStatus = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Widget isDataFetched(){
    if(!fetchDataStatus){
      String productTitle = StringUtils.capitalize(widget.category!);
      return Column(
        children: [
          Text(
            productTitle,
            style: const TextStyle(
              fontSize: 25,
              color: Color(0xff263238),
              fontWeight: FontWeight.bold,
            ),
          ),
          Column(
            children: productCardList,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all<Color>(const Color(0xff2196F3)),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => CategoryView(
                    category: widget.category,
                    displayTitle:StringUtils.capitalize(widget.category!),
                  ),
                ),
              );
            },
            child: const Text(
              "View More",
              style: TextStyle(
                color: Color(0xffFAFAFA),
              ),
            ),
          ),
        ],
      );
    } else {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 0),
        child : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Please Wait"),
            SizedBox(width:25.0,),
            CircularProgressIndicator()
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 2,
      ),
      child:isDataFetched(),
    );
  }
}
