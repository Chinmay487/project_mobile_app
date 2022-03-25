import "package:flutter/material.dart";

class LoginAction extends StatelessWidget {
  const LoginAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 0),
      child: GestureDetector(
        onTap: (){},
        child:const Text(
          "Login",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );;
  }
}

class LogoutAction extends StatelessWidget {
  const LogoutAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 0),
      child: GestureDetector(
        onTap: (){},
        child:const Text(
          "Logout",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

