import 'package:login_page_design/View/sign_up_page.dart';

import '../Widget/widgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyWidgets().GlassPaneForLoginPage(
        null,
        Column(
          children: [
            MyWidgets().TextFieldCustom("Email", TextInputType.emailAddress,Icons.email),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: MyWidgets().MyElevatedButton("Submit"),
            ),
            Container(
                margin: const EdgeInsets.only(top: 20),
                child: MyWidgets().TitleText("or", 15)),
            MyWidgets().ButtonStyle("Continue with Facebook",
                Image.asset("assets/images/facebook.png")),
            MyWidgets().ButtonStyle("Continue with Google",
                Image.asset("assets/images/google.png")),
            MyWidgets().ButtonStyle(
                "Continue with Apple", Image.asset("assets/images/apple.png")),
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: Column(
                children: [
                  Row(
                    children: [
                      MyWidgets().CustomTextButton("Don't have an account?",
                          0xffffffff,context),
                      MyWidgets().CustomTextButton(
                          "Sign Up", 0xff0080cd,context),
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

  
}


