import "package:flutter/material.dart";

class ButtonOutlined extends StatelessWidget {
  // const ButtonOutlined({Key? key}) : super(key: key);

  final String? displayText;
  final dynamic onTapFunction;

  ButtonOutlined({this.displayText,this.onTapFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: const Color(0xffB3E5FC),
          onTap: onTapFunction,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              child: Text(
                displayText!,
                style: const TextStyle(
                  color:Color(0xff1976D2),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
