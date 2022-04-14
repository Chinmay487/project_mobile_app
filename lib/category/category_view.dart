import "package:flutter/material.dart";
import 'package:number_paginator/number_paginator.dart';
import "../api/category_view_api.dart";
import "../products/product_card.dart";

class CategoryView extends StatefulWidget {

  final String? category;
  final String? displayTitle;

  CategoryView({this.category, this.displayTitle});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  int selectedPageNumber = 0;
  int numberOfPages = 1;
  List<Widget> listOfProducts = [];
  bool fetchDataStatus = false;
  bool noProducts = false;

  void fetchData({bool isInit = true}) async {
    setState(() {
      fetchDataStatus = true;
    });
    var data = await getProductList(
        category: widget.category, pageNumber: selectedPageNumber + 1);
    int totalNumberOfPages = 0;
    const url =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc";

    List<Widget> categoryList = [];
    if (data != null && data["product_list"].length > 0) {
      totalNumberOfPages = data["number_of_pages"];
      for (var element in data["product_list"]) {
        categoryList.add(ProductCard(
          title: element["title"],
          thumbnail: element["thumbnail"],
          price: element["price"],
          uniqueKey: element["key"],
          category: widget.category,
          onQuantityChange: null,
        ));
      }
    } else {
      setState(() {
        noProducts = true;
      });
      categoryList.add(
        const Center(
          child: Text(
            "Nothing Here",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
      );
    }
    setState(() {
      listOfProducts = categoryList;
      fetchDataStatus = false;
      if (isInit) {
        numberOfPages = totalNumberOfPages;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData(isInit: true);
  }

  void onPageNumberChange(int index) {
    if (selectedPageNumber != index) {
      setState(() {
        selectedPageNumber = index;
      });
      fetchData(isInit: false);
    }
  }

  Widget isDataFetched() {
    if (!fetchDataStatus) {
      return ListView(
        cacheExtent: 9999,
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
            child: Text(
              widget.displayTitle!,
              style: const TextStyle(
                fontSize: 25.0,
              ),
            ),
          ),
          ...listOfProducts,
        ],
      );
    }
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Please Wait",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          CircularProgressIndicator(),
        ],
      ),
    );
  }

  Widget getPaginator() {
    if (noProducts) {
      return Container();
    }
    return NumberPaginator(
      initialPage: 0,
      numberPages: numberOfPages,
      onPageChange: (int index) {
        onPageNumberChange(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffECEFF1),
        iconTheme: const IconThemeData(color: Color(0xff263238)),
        title: Text(
          widget.displayTitle!,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: isDataFetched(),
            ),
            getPaginator(),
          ],
        ),
      ),
    );
  }
}
