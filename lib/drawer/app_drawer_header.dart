import 'package:flutter/material.dart';
import "../authentication/auth_actions.dart";


class AppDrwerHeader extends StatelessWidget {
  // const AppDrwerHeader({Key? key}) : super(key: key);

  final String? avatarUrl;
  final String? name;
  final String? email;

  AppDrwerHeader({this.avatarUrl,this.name,this.email});

  @override
  Widget build(BuildContext context) {

    // const String _imageUrl = "https://ggsc.s3.amazonaws.com/images/uploads/The_Science-Backed_Benefits_of_Being_a_Dog_Owner.jpg";

    return Column(
      children:  [
        DrawerHeader(
          margin: const EdgeInsets.all(0),
          padding: const EdgeInsets.all(0),
          child: UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xffF5F5F5),
            ),
            accountName: Text(
              name!,
              style: const TextStyle(
                color: Colors.blueGrey,
              ),
            ),
            accountEmail: Text(
              email!,
              style: const TextStyle(
                color: Colors.blueGrey,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              // backgroundColor: Colors.white,
              radius: 45.0,
              backgroundImage: NetworkImage(avatarUrl!),
            ),
          ),
        ),
      ],
    );
  }
}
