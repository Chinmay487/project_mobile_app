import "package:flutter/material.dart";
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import "./user_rating.dart";

class UserReviewForm extends StatelessWidget {
  const UserReviewForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: Column(
        children: [
          const Text(
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
            child: const Text("Submit review"),
          )
        ],
      ),
    );
  }
}



