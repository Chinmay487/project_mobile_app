import "package:flutter/material.dart";
import "./home_page/home_page.dart";

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
        "/" : (context) => const HomePage(),
      },
    );
  }
}
