import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import "./home_page/home_page.dart";
import "./app_routes.dart";
import "./user/cart.dart";
import "./user/profile.dart";
import "./authentication/login_page.dart";
import "package:firebase_core/firebase_core.dart";
import "./authentication/google_app_auth.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(
    ChangeNotifierProvider(
      child:  const Root(),
      create: (context) => GoogleSignInProvider(),
    )
  );
}

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      initialRoute: "/",
      routes: {
        AppRoutes.homePageRoute: (context) => const HomePage(),
        // AppRoutes.detailViewRoute : (context) => DetailView(),
        AppRoutes.cartPageroute: (context) => Cart(
              idToken:
                  Provider.of<GoogleSignInProvider>(context, listen: true)
                      .idToken,
            ),
        AppRoutes.profilePageroute: (context) => Profile(
              idToken:
                  Provider.of<GoogleSignInProvider>(context, listen: true)
                      .idToken,
            ),
        // AppRoutes.moreReviewsRoute : (context) => const MoreReviews(),
        AppRoutes.loginPageRoute: (context) => const LoginPage(),
      },
    );
  }
}
