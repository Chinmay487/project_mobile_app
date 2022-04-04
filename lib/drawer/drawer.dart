import 'package:basic_utils/basic_utils.dart';
import "package:flutter/material.dart";
import "./app_drawer_header.dart";
import "./drawer_element.dart";
import "../authentication/auth_actions.dart";
import "../category/category_view.dart";
import "package:provider/provider.dart";
import "../authentication/google_app_auth.dart";
import "../app_routes.dart";

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  void pushToCategoryPage(
      {String category = "",
      String displayTitle = "",
      required BuildContext context}) {
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => CategoryView(
          category: category,
          displayTitle: displayTitle,
        ),
      ),
    );
  }

  List<Widget> getAuthMenu(BuildContext context) {
    var idToken =
        Provider.of<GoogleSignInProvider>(context, listen: true).idToken;
    if (idToken == null) {
      return const [
        Divider(thickness: 1.0,),
        LoginAction()
      ];
    }
    return const [
      Divider(
        thickness: 2.0,
      ),
      ProfileAction(),
      CartAction(),
      LogoutAction(),
    ];
  }

  Widget getDrawerHeader(BuildContext context) {
    var idToken = Provider.of<GoogleSignInProvider>(context, listen: true).idToken;
    var user = Provider.of<GoogleSignInProvider>(context,listen: true).user;
    if (idToken == null) {
      return Container();
    }
    return AppDrwerHeader(
      name: user?.displayName,
      email: user?.email,
      avatarUrl: user?.photoUrl,
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.65,
        child: Drawer(
          // backgroundColor: ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              getDrawerHeader(context),
              DrawerElement(
                category: "Home Screen",
                onTapFunction: (){
                  Navigator.pushNamed(context,AppRoutes.homePageRoute);
                },
              ),
              DrawerElement(
                category: "laptop",
                onTapFunction: () {
                  pushToCategoryPage(
                      category: "laptop",
                      displayTitle: "Laptop",
                      context: context);
                },
              ),
              DrawerElement(
                category: "camera",
                onTapFunction: () {
                  pushToCategoryPage(
                      category: "camera",
                      displayTitle: "Camera",
                      context: context);
                },
              ),
              DrawerElement(
                category: "iphone",
                onTapFunction: () {
                  pushToCategoryPage(
                      category: "iphone",
                      displayTitle: "iPhone",
                      context: context);
                },
              ),
              DrawerElement(
                category: "Clock",
                onTapFunction: () {
                  pushToCategoryPage(
                      category: "clock",
                      displayTitle: "Clock",
                      context: context);
                },
              ),
              DrawerElement(
                category: "Watch",
                onTapFunction: () {
                  pushToCategoryPage(
                      category: "watch",
                      displayTitle: "Watch",
                      context: context);
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Column(
                children: getAuthMenu(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
