import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Reviews extends StatelessWidget {
  const Reviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: const Text(
            "Customer Reviews",
            style: TextStyle(
              fontSize: 18,
              color: Color(0xff546E7A),
            ),
          ),
        ),
        ReviewCard(),
        ReviewCard(),
      ],
    );
  }
}

class ReviewCard extends StatelessWidget {
  const ReviewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const String _review = "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo ducimus error nihil a tenetur eaque, facere doloremque veritatis at? Quidem.Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo ducimus error nihil a tenetur eaque, facere doloremque veritatis at? Quidem.Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo ducimus error nihil a tenetur eaque, facere doloremque veritatis at? Quidem.";

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Card(
          color: Color(0xffEEEEEE),
          elevation: 5,
          shadowColor: Color(0xffCFD8DC),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
            child: Column(
              children: const [
                  Text(
                    _review,
                  ),
                UserRating(),
              ],
            )
          ),
        ),
      ),
    );
  }
}

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

