import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class SplashSceen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitSate();
}

class InitSate extends State<SplashSceen> {
  // علشان يقدر ينتقل من هذه الصفحة خلال 3 ثواني و يروح على تسجيل الدخول
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 3);
    return new Timer(duration, loginRoute);
  }

  loginRoute() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  initWidget() {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            color: new Color(0xffC5ECF8),
            gradient: LinearGradient(colors: [
              (Color.fromARGB(255, 199, 242, 244)),
              Color.fromARGB(255, 141, 213, 215)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
        ),
        Center(
          child: Container(
              child: Image.asset(
            "assets/images/travelling-logo.png",
          )),
        )
      ]),
    );
  }
}
