import "package:flutter/material.dart";
import "./home_page/home_page.dart";
import "./app_routes.dart";
import "./products/detail_view.dart";
import "./user/cart.dart";
import "./user/profile.dart";
import "./products/more_reviews.dart";

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
        // AppRoutes.detailViewRoute : (context) => DetailView(),
        AppRoutes.cartPageroute : (context) => const Cart(),
        AppRoutes.profilePageroute : (context) => const Profile(),
        // AppRoutes.moreReviewsRoute : (context) => const MoreReviews(),
      },
    );
  }
}
