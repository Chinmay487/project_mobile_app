import "package:flutter/material.dart";
import "../app_routes.dart";
import "package:provider/provider.dart";
import "../authentication/google_app_auth.dart";

class LoginAction extends StatelessWidget {
  const LoginAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: GestureDetector(
        onTap: () {
          final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
          provider.googleLogin();
          // Navigator.pushNamed(context,"/login");
        },
        child: const Text(
          "Login",
          style: TextStyle(fontSize: 16, color: Colors.blueGrey),
        ),
      ),
    );
  }
}

class LoginActionButton extends StatelessWidget {
  const LoginActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: ElevatedButton(
        // style: ButtonStyle(
        //   backgroundColor: MaterialStateProperty.all<Color>(Color(0xffCFD8DC)),
        // ),
        onPressed: () {},
        child: const Text(
          "Login",
          style: TextStyle(fontSize: 16, color: Color(0xff37474F)),
        ),
      ),
    );
  }
}

class LogoutAction extends StatelessWidget {
  const LogoutAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: GestureDetector(
        onTap: () {
          final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
          provider.logoutUser();
        },
        child: const Text(
          "Logout",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class CartAction extends StatelessWidget {
  const CartAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.cartPageroute);
        },
        child: const Text(
          "View Cart",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class ProfileAction extends StatelessWidget {
  const ProfileAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.profilePageroute);
        },
        child: const Text(
          "Profile",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}




