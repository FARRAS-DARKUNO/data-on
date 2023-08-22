import 'package:data_on/global/type.dart';
import 'package:data_on/utils/route.dart';
import 'package:data_on/widget/button/normal_button.dart';
import 'package:data_on/widget/input/text_input.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../global/colors.dart';
import '../global/fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  bool isLoading = false;

  loginHandler () async{
    final pref = await SharedPreferences.getInstance();
    var username = pref.getString(tyUSERNAME) ?? 'p';
    var password = pref.getString(tyPASSWORD) ?? 'p';

    if (username == usernameController.text && password == passwordController.text){
      gotoNavigation(context);
    }

  }
 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  TextInput(
                    controller: usernameController,
                    tag: 'Username',
                    title: 'Username',
                    isPassword: false,
                  ),
                  TextInput(
                    controller: passwordController,
                    tag: 'Password',
                    title: 'Password',
                    isPassword: true,
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => loginHandler(),
                    child: NormalButton(title: isLoading ? 'Loading' : 'Login'),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Dont have an account?   ', style: body1(cBlack)),
                      GestureDetector(
                        onTap: () => gotoRegister(context),
                        child: Text('Sign Up', style: body1(cSekunder)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
