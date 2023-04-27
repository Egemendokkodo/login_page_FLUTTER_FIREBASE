import '../Widget/widgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyWidgets().GlassPaneForLoginPage(Column(
      children: [
        MyWidgets().TextFieldCustom(
            null, "Email", TextInputType.emailAddress, Icons.email),
        Container(
          margin: const EdgeInsets.only(top: 15),
          child: MyWidgets().MyElevatedButtonLogin("Submit"),
        ),
        Container(
            margin: const EdgeInsets.only(top: 20),
            child: MyWidgets().TitleText("or", 15)),
        MyWidgets().ButtonStyle("Continue with Facebook",
            Image.asset("assets/images/facebook.png")),
        MyWidgets().ButtonStyle(
            "Continue with Google", Image.asset("assets/images/google.png")),
        MyWidgets().ButtonStyle(
            "Continue with Apple", Image.asset("assets/images/apple.png")),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: Column(
            children: [
              Row(
                children: [
                  MyWidgets().CustomTextButton(
                      "Don't have an account?", 0xffffffff, context),
                  MyWidgets().CustomTextButton("Sign Up", 0xff0080cd, context),
                ],
              ),
              Container(
                alignment: Alignment.topLeft,
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot your password?",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Color(0xff0080cd)),
                    )),
              )
            ],
          ),
        ),
      ],
    ));
  }

  ElevatedButton MyElevatedButton(String s) {
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
        style: TextStyle(fontSize: 20, color: Color(0xfff0ffff)),
      ),
    );
  }
}
