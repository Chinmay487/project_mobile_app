import "package:flutter/material.dart";
import "./user_rating.dart";


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