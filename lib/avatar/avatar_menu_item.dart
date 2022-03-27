import "package:flutter/material.dart";

class AvatarMenuItem extends StatelessWidget {
  // const AvatarMenuItem({Key? key}) : super(key: key);
  final dynamic onTapFunction;
  final String? displayText;

  AvatarMenuItem({this.onTapFunction,this.displayText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onTapFunction,
            child: Text(displayText!),
          ),
        ),
      ],
    );
  }
}
