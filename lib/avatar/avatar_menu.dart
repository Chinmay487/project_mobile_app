import "package:flutter/material.dart";
import "./avatar_menu_item.dart";
import "../app_routes.dart";

class AvatarMenu extends StatelessWidget {
  const AvatarMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _imageUrl =
        "https://ggsc.s3.amazonaws.com/images/uploads/The_Science-Backed_Benefits_of_Being_a_Dog_Owner.jpg";
    return PopupMenuButton(
      offset: const Offset(0.0, 55.0),
      icon: CircleAvatar(
        backgroundImage: NetworkImage(_imageUrl),
      ),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
              child: AvatarMenuItem(
                onTapFunction: () {
                  print("profile");
                  Navigator.pushNamed(context, AppRoutes.profilePageroute);
                },
                displayText: "Profile",
              )
          ),
          PopupMenuItem(
              child: AvatarMenuItem(
                displayText: "Cart",
                onTapFunction: () {
                  print("cart");
                  Navigator.pushNamed(context, AppRoutes.cartPageroute);
                },
              )
          ),
          PopupMenuItem(
            child: AvatarMenuItem(
              onTapFunction: (){
                print("Logout Tap");
              },
              displayText: "Logout",
            ),
          ),
        ];
      },
    );
  }
}