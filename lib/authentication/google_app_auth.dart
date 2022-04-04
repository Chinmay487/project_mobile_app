
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier{
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? user;
  dynamic idToken;


  Future googleLogin() async{
    dynamic googleAuth, credential;
   try{
     final googleUser = await googleSignIn.signIn();
     if(googleUser != null){
       user = googleUser;
     } else {
       return;
     }
      googleAuth = await googleUser.authentication;
      credential = GoogleAuthProvider.credential(
         accessToken : googleAuth.accessToken,
         idToken : idToken
     );

     await FirebaseAuth.instance.signInWithCredential(credential);

     final tokenResult = await FirebaseAuth.instance.currentUser!;
     idToken = await tokenResult.getIdToken();

   } catch (error){
     logoutUser();
   }
    notifyListeners();
  }

  Future<void> logoutUser() async{
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
    idToken = null;
    user = null;
    notifyListeners();
  }

}