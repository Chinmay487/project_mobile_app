import "package:flutter/material.dart";
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class UserRating extends StatelessWidget {
  const UserRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 3,
      itemSize: 20,
      ignoreGestures:true,
      // minRating: 1,
      direction: Axis.horizontal,
      // allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        // print(rating);
      },
    );
  }
}