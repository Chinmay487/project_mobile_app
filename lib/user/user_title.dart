import "package:flutter/material.dart";

class UserTitle extends StatelessWidget {

  final String? title;

  UserTitle({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        title!,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}
