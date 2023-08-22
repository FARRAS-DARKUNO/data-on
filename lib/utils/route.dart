
import 'package:data_on/screen/login_screen.dart';
import 'package:data_on/screen/register_screen.dart';
import 'package:data_on/widget/navigation/bottom_navigation.dart';
import 'package:flutter/cupertino.dart';

gotoLogin(BuildContext context) {
  Navigator.of(context).push(CupertinoPageRoute<void>(
    builder: (BuildContext context) => const LoginScreen(),
  ));
}

gotoRegister(BuildContext context) {
  Navigator.of(context).push(CupertinoPageRoute<void>(
    builder: (BuildContext context) => const RegisterScreen(),
  ));
}

gotoNavigation(BuildContext context) {
  Navigator.of(context).push(CupertinoPageRoute<void>(
    builder: (BuildContext context) => const BottomNavigation(),
  ));
}

goBack(BuildContext context) {
  Navigator.pop(context);
}