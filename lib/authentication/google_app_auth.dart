
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier{
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  Future GoogleLogin() async{
    final googleUser = await googleSignIn.signIn();
    if(googleUser != null){
      _user = googleUser;
      print(googleUser);
    } else {
      return;
    }
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken : googleAuth.accessToken,
      idToken : googleAuth.idToken
    );
    print(credential);
    notifyListeners();
  }

}