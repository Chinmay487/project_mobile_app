import "package:flutter/material.dart";
import "./app_drawer_header.dart";
import "./drawer_element.dart";
import "../authentication/auth_actions.dart";
import "../category/category_view.dart";

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  void pushToCategoryPage(
      {String category = "", String displayTitle="",required BuildContext context}) {
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(
          builder: (BuildContext context) => CategoryView(
                category: category,
                displayTitle : displayTitle,
              ),
      ),
    );
  }

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
                children: [
                  DrawerElement(
                    category: "laptop",
                    onTapFunction: () {
                      pushToCategoryPage(category: "laptop",displayTitle:"Laptop" ,context: context);
                    },
                  ),
                  DrawerElement(
                    category: "camera",
                    onTapFunction: () {
                      pushToCategoryPage(category: "camera",displayTitle:"Camera", context: context);
                    },
                  ),
                  DrawerElement(
                    category: "iphone",
                    onTapFunction: () {
                      pushToCategoryPage(category: "iphone",displayTitle:"iPhone", context: context);
                    },
                  ),
                  DrawerElement(
                    category: "Clock",
                    onTapFunction: () {
                      pushToCategoryPage(category: "clock",displayTitle:"Clock", context: context);
                    },
                  ),
                  DrawerElement(
                    category: "Watch",
                    onTapFunction: () {
                      pushToCategoryPage(category: "watch",displayTitle:"Watch", context: context);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              const Divider(
                thickness: 2.0,
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  LoginAction(),
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
