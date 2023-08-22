import 'package:data_on/global/type.dart';
import 'package:data_on/utils/route.dart';
import 'package:data_on/widget/button/normal_button.dart';
import 'package:data_on/widget/input/text_input.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final username = TextEditingController();
  final password = TextEditingController();

  changeHandler(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(tyUSERNAME, username.text);
    pref.setString(tyPASSWORD, password.text);
  }

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              TextInput(
                tag: 'Change Username',
                controller: username,
                isPassword: false,
                title: 'Change Username',
              ),
              const SizedBox(height: 10),
              TextInput(
                tag: 'Change Password',
                controller: password,
                isPassword: true,
                title: 'Change Password',
              ),
              const SizedBox(height: 30),
              GestureDetector(
                // onTap: () => registrationHandler(context),
                child: const NormalButton(title: 'Change'),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () => gotoLogin(context),
                child: const NormalButton(title: 'Logout'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
