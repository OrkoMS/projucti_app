

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:projucti_app/src/common/colors.dart';
import 'package:projucti_app/src/repository/authRepo.dart';
import 'package:projucti_app/src/screens/homeScreen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _width=MediaQuery.of(context).size.width;
    var _height=MediaQuery.of(context).size.height;


    return SafeArea(
      child: Scaffold(
          body: Container(
            color: whiteTextFieldColor,
            width: _width,
            height: _height,
            child: SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 5,
                        primary: inactiveSubmitButtonColor,
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                        textStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    onPressed: () async{
                      ProjuctiAuthService projuctiAuthService =ProjuctiAuthService();
                      await projuctiAuthService.googleLogin();
                      final user =FirebaseAuth.instance.currentUser;
                      if(user!=null) {
                        Navigator.pushReplacement(context, PageTransition(type:
                        PageTransitionType.fade, child: HomeScreen()));
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/google.png",width: _width/8,
                          ),
                          SizedBox(height: 8,),
                          Text(
                            "Sign In",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              decoration: TextDecoration.none,
                              fontSize: 20,
                              color: titleTextColor,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 36,),
                  Text(
                    "Please click the button to get started",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      decoration: TextDecoration.none,
                      fontSize: 16,
                      color: titleTextColor,
                      fontWeight: FontWeight.w300,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
      ),
    );

  }

}