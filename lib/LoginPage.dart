import 'dart:ui';
import 'widgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
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
                    child: MyWidgets().TitleText("Welcome!", 30)),
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
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            MyWidgets().TextFieldCustom(
                                "Email", TextInputType.emailAddress),
                            Container(
                              margin: const EdgeInsets.only(top: 15),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: const Color(0xff1b8bb4),
                                  minimumSize: const Size.fromHeight(50),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'Submit',
                                  style: TextStyle(
                                      fontSize: 20, color: Color(0xfff0ffff)),
                                ),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(top: 20),
                                child: MyWidgets().TitleText("or", 15)),
                            MyWidgets().ButtonStyle("Continue with Facebook",
                                Image.asset("assets/images/facebook.png")),
                            MyWidgets().ButtonStyle("Continue with Google",
                                Image.asset("assets/images/google.png")),
                            MyWidgets().ButtonStyle("Continue with Apple",
                                Image.asset("assets/images/apple.png")),
                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      MyWidgets().CustomTextButton(
                                          "Don't have an account?", 0xffffffff),
                                      MyWidgets().CustomTextButton(
                                          "Sign Up", 0xff0080cd)
                                    ],
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          "Forgot your password?",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Color(0xff0080cd)),
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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
}
