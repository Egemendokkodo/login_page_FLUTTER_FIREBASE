import 'package:flutter/material.dart';
import 'package:login_page_design/Firebase/operations.dart';

import 'dart:ui';
import '../View/sign_up_page.dart';

class MyWidgets {
  AppBar MyAppBar(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: 56,
          height: 56,
          decoration: const BoxDecoration(
            backgroundBlendMode: BlendMode.hardLight,
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
          child: const Padding(
            padding: EdgeInsets.only(left: 5),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  TextField TextFieldCustom(TextEditingController? controller, String s,
      TextInputType emailAddress, IconData email,
      [IconData? icon]) {
    return TextField(
      controller: controller,
      keyboardType: emailAddress,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: s,
        contentPadding: const EdgeInsets.all(20),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
    );
  }

  Text TitleText(String s, double i) {
    return Text(
      s,
      style: TextStyle(
          color: const Color.fromARGB(255, 255, 255, 255),
          fontSize: i,
          fontWeight: FontWeight.bold),
    );
  }

  Container ButtonStyle(String s, Image icon) {
    return Container(
        margin: const EdgeInsets.only(top: 15),
        child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              alignment: Alignment.centerLeft,
              backgroundColor: const Color(0xffffffff),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              minimumSize: const Size.fromHeight(50),
            ),
            onPressed: () {
              if (s.toString() == "Continue with Facebook".toString()) {
                //print(s);
              }
              if (s == "Continue with Google") {}
              if (s == "Continue with Apple") {}
            },
            icon: icon,
            label: Align(
                alignment: Alignment.center,
                child: Text(s,
                    style: const TextStyle(color: Color(0xff0080cd))))));
  }

  ElevatedButton MyElevatedButtonSendData(
      BuildContext context,
      String s,
      TextEditingController emailController,
      TextEditingController passwordController,
      TextEditingController nameController,
      TextEditingController surnameController,
      TextEditingController usernameController,
      TextEditingController rePasswordController) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: const Color(0xff1b8bb4),
        minimumSize: const Size.fromHeight(50),
      ),
      onPressed: () async {
        //TODO:: BURADA VERİTABANINA KAYDET
        DatabaseOperations().checkCredentials(context,emailController.text,passwordController.text,nameController.text,surnameController.text,usernameController.text,rePasswordController.text);
      },
      child: Text(
        s,
        style: const TextStyle(fontSize: 20, color: Color(0xfff0ffff)),
      ),
    );
  }

  ElevatedButton MyElevatedButtonLogin(
    String s,
  ) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: const Color(0xff1b8bb4),
        minimumSize: const Size.fromHeight(50),
      ),
      onPressed: () {},
      child: Text(
        s,
        style: const TextStyle(fontSize: 20, color: Color(0xfff0ffff)),
      ),
    );
  }

  TextButton CustomTextButton(String s, int i, BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SignUpPage()));
        },
        child: Text(
          s,
          style: TextStyle(color: Color(i)),
        ));
  }

  Scaffold GlassPaneForLoginPage([Column? column]) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/img2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: MyWidgets().TitleText("Sign Up", 30)),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      blurRadius: 24,
                      spreadRadius: 16,
                      color: Colors.black.withOpacity(0.9))
                ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 4.0,
                      sigmaY: 4.0,
                    ),
                    child: Container(
                      height: 500,
                      width: 380,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16.0)),
                      child: Padding(
                          padding: const EdgeInsets.all(20), child: column),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Scaffold GlassPaneForSignUpPage(
      [PreferredSize? preferredSize, Column? column]) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: preferredSize,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/img2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: MyWidgets().TitleText("Sign Up", 30)),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      blurRadius: 24,
                      spreadRadius: 16,
                      color: Colors.black.withOpacity(0.9))
                ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 4.0,
                      sigmaY: 4.0,
                    ),
                    child: Container(
                      height: 500,
                      width: 380,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16.0)),
                      child: Padding(
                          padding: const EdgeInsets.all(20), child: column),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void MySnackbar(BuildContext context, String s) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.white,
      content: Text(
        s,
        style: const TextStyle(color: Colors.black87),
      ),
    ));
  }
}
