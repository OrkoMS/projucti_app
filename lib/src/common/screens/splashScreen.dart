

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:projucti_app/src/common/screens/loginScreen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTime() async {
    var _duration = new Duration(milliseconds: 1500);
    return new Timer(_duration, navigationPage);
  }
  void navigationPage() {
    Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: LoginScreen()));
  }


  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    var _width=MediaQuery.of(context).size.width;
    var _height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
              width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: Center(
              child: Image.asset(
                "assets/logo.png",width: _width/1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
