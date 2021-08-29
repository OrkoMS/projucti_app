import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
class ProjuctiAuthService{

  final googleSingIn = GoogleSignIn();
  GoogleSignInAccount _user;
  GoogleSignInAccount get user =>_user;

  Future googleLogin()async{
    final googleUser = await googleSingIn.signIn();
    if(googleUser==null) return;
    _user=googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final result =await FirebaseAuth.instance.signInWithCredential(credential);
    print("==================================");
    print(result.additionalUserInfo.profile);
  }
  Future logout()async{
    await googleSingIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}