import 'package:flutter/material.dart';
import "./review_card.dart";

class Reviews extends StatelessWidget {
  const Reviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
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




