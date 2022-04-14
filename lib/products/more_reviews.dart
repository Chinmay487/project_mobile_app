import "package:flutter/material.dart";
import "./review_card.dart";
import "../api/detail_view_api.dart";


class MoreReviews extends StatefulWidget {


  final String? category;
  final String? uniqueKey;

  MoreReviews({this.category,this.uniqueKey});

  @override
  State<MoreReviews> createState() => _MoreReviewsState();
}

class _MoreReviewsState extends State<MoreReviews> {

  List<Widget> reviewsList = [];

  bool dataFetchStatus = false;

  void fetchData() async{
    setState(() {
      dataFetchStatus = true;
    });
    List<Widget> reviews = [];
    var data = await getProductReviews(category: widget.category,uniqueKey: widget.uniqueKey);
    if(data.length > 0){
      for(var element in data){
        reviews.add(
            ReviewCard(
              rating: element["rating"] + 0.0,
              reviewTitle: element["title"],
              description: element["description"],
            )
        );
      }
    } else {
      reviews.add(
         const Center(
           child: Text(
               "No Reviews Available",
             style: TextStyle(
               fontSize: 20,
             ),
           ),
           ),
      );
    }
    setState(() {
      reviewsList = reviews;
      dataFetchStatus = false;
    });
  }

  @override
  void initState(){
    super.initState();
    fetchData();
  }

  Widget isDataFetched(){
    if(!dataFetchStatus){
      return Column(
        children: reviewsList,
      );
    }
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
              "Please Wait",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(width: 20,),
          CircularProgressIndicator()
        ],
      ),
    );

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xff37474F)),
        backgroundColor: const Color(0xffECEFF1),
        title: const Text(
            "More Reviews",
          style: TextStyle(
            color: Colors.blueGrey,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children:  [
            Container(
              margin:const  EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 0,
              ),
              alignment: Alignment.center,
              child: Text(
                  widget.category!,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            isDataFetched(),
          ],
        ),
      ),
    );
  }
}
