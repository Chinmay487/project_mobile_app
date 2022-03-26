import "package:flutter/material.dart";
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class UserReviewForm extends StatelessWidget {
  const UserReviewForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: Column(
        children: [
          Text(
            "Submit Your review",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          TextFormField(
            onChanged: (value) {},
            decoration: const InputDecoration(
              hintText: "Title",
              labelText: "Title",
            ),
          ),
          TextFormField(
            maxLines: 6,
            onChanged: (value) {},
            decoration: const InputDecoration(
              hintText: "Enter your review here",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const UserRatingInput(),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Submit review"),
          )
        ],
      ),
    );
  }
}

class UserRatingInput extends StatelessWidget {
  const UserRatingInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 0,
      itemSize: 20,
      // ignoreGestures: true,
      minRating: 0,
      direction: Axis.horizontal,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {},
    );
  }
}

