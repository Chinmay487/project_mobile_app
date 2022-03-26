import "package:flutter/material.dart";
import "./app_drawer_header.dart";
import "./drawer_element.dart";
import "../authentication/auth_actions.dart";


class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.65,
        child: Drawer(
          // backgroundColor: ,
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const AppDrwerHeader(),
              Column(
                children: [
                  DrawerElement(category: "Home",),
                  DrawerElement(category:"laptop"),
                  DrawerElement(category: "camera",),
                  DrawerElement(category:"iphone",),
                  DrawerElement(category:"Clock",),
                  DrawerElement(category:"Watch",),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.2,
              ),
              const Divider(
                thickness: 2.0,
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children:const  [
                  // LoginAction(),
                  ProfileAction(),
                  CartAction(),
                  LogoutAction(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
