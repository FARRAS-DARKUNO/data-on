import 'dart:io';

import 'package:data_on/global/colors.dart';
import 'package:data_on/global/type.dart';
import 'package:data_on/utils/route.dart';
import 'package:data_on/widget/button/back_button_custome.dart';
import 'package:data_on/widget/button/normal_button.dart';
import 'package:data_on/widget/input/text_input.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final username = TextEditingController();
  final password = TextEditingController();

  File? fileImage;


 registrationHandler(BuildContext context) async{
  final pref = await SharedPreferences.getInstance();
  pref.setString(tyUSERNAME, username.text);
  pref.setString(tyPASSWORD, password.text);

  gotoLogin(context);
 }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const BackButtonCustome(tittle: 'Sign Up'),
                changeImage(context),
                TextInput(
                  tag: 'Username',
                  controller: username,
                  isPassword: false,
                  title: 'Username',
                ),
                const SizedBox(height: 10),
                TextInput(
                  tag: 'Password',
                  controller: password,
                  isPassword: true,
                  title: 'Password',
                ),
                const SizedBox(height: 10),
               
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () => registrationHandler(context),
                  child:
                     const  NormalButton(title: 'Register'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
    Widget changeImage(BuildContext context) {
    Future getImageGalery() async {
      final ImagePicker picker = ImagePicker();
      final XFile? imagePicker =
          await picker.pickImage(source: ImageSource.gallery);
      fileImage = imagePicker == null ? null : File(imagePicker.path);
      setState(() {});
    }

    return Stack(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: fileImage == null ? null : FileImage(fileImage!),
          backgroundColor: cGrey,
          child: fileImage == null
              ? const Icon(Icons.person, size: 60, color: cWhite)
              : Container(),
        ),
        Container(
          margin: const EdgeInsets.only(left: 60, top: 60),
          child: GestureDetector(
            onTap: () => getImageGalery(),
            child: const CircleAvatar(
              radius: 20,
              backgroundColor: cWhite,
              child: Icon(Icons.edit, color: cTersier),
            ),
          ),
        )
      ],
    );
  }
}
