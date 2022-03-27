import "package:flutter/material.dart";

class UserTitle extends StatelessWidget {
  // const UserTitle({Key? key}) : super(key: key);

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
