import 'package:flutter/material.dart';
import 'package:travelling_app/helper/auth_helper.dart';
import 'package:travelling_app/screens/categories_screen.dart';

import '../widgets/login_screen.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  resetController() {
    emailController.clear();
    passwordController.clear();
  }

  rigster(BuildContext context) async {
    var userCredential = await AuthHepler.authHepler.Signup(
        emailController.text.trim(), passwordController.text.trim(), context);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  login(BuildContext context) async {
    var userCredential = await AuthHepler.authHepler
        .signin(emailController.text.trim(), passwordController.text.trim());
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CategoriesScreen()));
  }
}
