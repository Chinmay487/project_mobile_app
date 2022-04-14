import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier{
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? user;
  dynamic idToken;
  late String name;
  late String email;

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

     final tokenResult = FirebaseAuth.instance.currentUser!;
     idToken = await tokenResult.getIdToken();
     name = googleUser.displayName!;
     email = googleUser.email;

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

  void getUpdatedIdToken(){
    FirebaseAuth.instance
        .idTokenChanges()
        .listen((user) {
      if (user == null) {
        idToken = null;
      } else {
        user.getIdToken().then((String token) {
          idToken = token;
        });
      }
    });
    notifyListeners();
  }

}