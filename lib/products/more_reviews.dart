import "package:flutter/material.dart";
import "./review_card.dart";


class MoreReviews extends StatelessWidget {
  const MoreReviews({Key? key}) : super(key: key);

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
              child: const Text(
                  "Product Reviews",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            // SizedBox(height: 20,),
            ReviewCard(),
            ReviewCard(),
            ReviewCard(),
            ReviewCard(),
            ReviewCard(),
            ReviewCard(),
            ReviewCard(),
            ReviewCard(),
            ReviewCard(),
            ReviewCard(),
          ],
        ),
      ),
    );
  }
}
