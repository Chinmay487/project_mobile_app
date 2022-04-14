import "package:flutter/material.dart";
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import "package:provider/provider.dart";
import "../authentication/google_app_auth.dart";
import "../api/detail_view_api.dart";

class UserReviewForm extends StatefulWidget {

  final String? idToken;
  final String? uniqueId;
  final String? category;

  UserReviewForm({this.idToken, this.uniqueId, this.category});

  @override
  State<UserReviewForm> createState() => _UserReviewFormState();
}

class _UserReviewFormState extends State<UserReviewForm> {
  final _formKey = GlobalKey<FormState>();
  bool submitButtonState = false;
  String title = "";
  String description = "";
  double rating = 0.0;

  void onReviewFormSubmit() async {
    setState(() {
      submitButtonState = true;
    });
    var formValidation = _formKey.currentState!.validate();
    if (formValidation) {
      await submitReview(
          idToken: widget.idToken,
          id: widget.uniqueId,
          category: widget.category,
          rating: rating,
          title: title,
          description: description);
    }
    setState(() {
      submitButtonState = false;
      title = "";
      rating = 0.0;
      description = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    var idToken =
        Provider.of<GoogleSignInProvider>(context, listen: true).idToken;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const Text(
              "Submit Your review",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value == "") {
                  return "Please Fill This";
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  title = value;
                });
              },
              decoration: const InputDecoration(
                hintText: "Title",
                labelText: "Title",
              ),
            ),
            TextFormField(
              maxLines: 6,
              validator: (value) {
                if (value == "") {
                  return "Please Fill This";
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  description = value;
                });
              },
              decoration: const InputDecoration(
                hintText: "Enter your review here",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RatingBar.builder(
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
              onRatingUpdate: (value) {
                // print(value);
                rating = value;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            submitButtonState
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ElevatedButton(
                    onPressed: idToken == null ? null : onReviewFormSubmit,
                    child: const Text("Submit review"),
                  )
          ],
        ),
      ),
    );
  }
}
