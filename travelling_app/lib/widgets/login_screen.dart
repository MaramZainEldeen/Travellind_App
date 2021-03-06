import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelling_app/models/trip.dart';
import 'package:travelling_app/providers/auth_provider.dart';
import 'package:travelling_app/widgets/app_drawer.dart';
import 'package:travelling_app/widgets/sign_up_screen.dart';

import '../screens/categories_screen.dart';
import '../screens/tabs_screen.dart';
import 'category_item.dart';

class LoginScreen extends StatefulWidget {
  static const screenRoute = '/Login-trips';

  // للانتقال الى صفحة جديدة
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(LoginScreen.screenRoute, arguments: {
      'id': Trip,
      'title': Trip,
    });
  }

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<AuthProvider>(builder: (context, provider, x) {
      return SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              color: new Color(0xffC5ECF8),
              gradient: LinearGradient(colors: [
                (Color.fromARGB(255, 199, 242, 244)),
                Color.fromARGB(255, 141, 213, 215)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Image.asset(
                    "assets/images/app_logo.png",
                    height: 90,
                    width: 90,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20, top: 20),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "تسجيل الدخول",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )
              ],
            )),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20, right: 20, top: 70),
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey[200],
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEE)),
              ],
            ),
            child: TextField(
              controller: provider.emailController,
              cursorColor: Color.fromARGB(255, 141, 213, 215),
              decoration: InputDecoration(
                icon: Icon(
                  Icons.email,
                  color: Color.fromARGB(255, 141, 213, 215),
                ),
                hintText: "أدخل الإيميل",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xffEEEEEE),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 20),
                    blurRadius: 100,
                    color: Color(0xffEEEEEE)),
              ],
            ),
            child: TextField(
              controller: provider.passwordController,
              cursorColor: Color.fromARGB(255, 141, 213, 215),
              decoration: InputDecoration(
                focusColor: Color.fromARGB(255, 141, 213, 215),
                icon: Icon(
                  Icons.vpn_key,
                  color: Color.fromARGB(255, 141, 213, 215),
                ),
                hintText: "كلمة السر",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                // Write Click Listener Code Here
              },
              child: Text(" نسيت كلمة السر؟"),
            ),
          ),
          GestureDetector(
            onTap: () {
              provider.login(context);
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => CategoriesScreen(),
              //     ));
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 70),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  (Color.fromARGB(255, 181, 231, 234)),
                  Color.fromARGB(255, 141, 213, 215)
                ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)),
                ],
              ),
              child: Text(
                "تسجيل الدخول",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("ليس لديك حساب؟  "),
                GestureDetector(
                  child: Text(
                    "سجل الان",
                    style: TextStyle(color: Color.fromARGB(255, 141, 213, 215)),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ));
                  },
                )
              ],
            ),
          )
        ],
      ));
    }));
  }
}

@override
State<StatefulWidget> createState() {
  // TODO: implement createState
  throw UnimplementedError();
}
