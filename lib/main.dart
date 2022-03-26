import "package:flutter/material.dart";
import "./home_page/home_page.dart";
import "./app_routes.dart";
import "./products/detail_view.dart";

void main(){
  return runApp(const Root());
}


class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes:{
        AppRoutes.homePageRoute : (context) => const HomePage(),
        AppRoutes.detailViewRoute : (context) => const DetailView(),
      },
    );
  }
}
