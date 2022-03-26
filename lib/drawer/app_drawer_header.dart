import 'package:flutter/material.dart';
import "../authentication/auth_actions.dart";


class AppDrwerHeader extends StatelessWidget {
  const AppDrwerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const String _imageUrl = "https://ggsc.s3.amazonaws.com/images/uploads/The_Science-Backed_Benefits_of_Being_a_Dog_Owner.jpg";

    return Column(
      children:  const [
        DrawerHeader(
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.all(0),
          child: UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xffF5F5F5),
            ),
            accountName: Text(
              "Chinmay Patil",
              style: TextStyle(
                color: Colors.blueGrey,
              ),
            ),
            accountEmail: Text(
              "chinmay@email.com",
              style: TextStyle(
                color: Colors.blueGrey,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              // backgroundColor: Colors.white,
              radius: 45.0,
              backgroundImage: NetworkImage(_imageUrl),
            ),
          ),
        ),
      ],
    );
  }
}
