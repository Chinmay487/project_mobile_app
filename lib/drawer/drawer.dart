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
            children: [
              const AppDrwerHeader(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      DrawerElement(category:"laptop"),
                      DrawerElement(category: "camera",),
                      DrawerElement(category:"iphone",),
                      DrawerElement(category:"Clock",),
                      DrawerElement(category:"Watch",),
                    ],
                  ),
                  Column(
                    children:const  [
                      LoginAction(),
                      LogoutAction(),
                    ],
                  )


                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
