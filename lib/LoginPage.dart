import 'dart:ui';

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
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Welcome!",
                    style: TextStyle(
                        color: Color(0xff1b8bb4),
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  )),
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
                            TextField(
                              decoration: InputDecoration(
                                hintText: "Email",
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
                            ),
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
                                child: const Text("or",
                                    style: TextStyle(color: Colors.white))),
                            ButtonStyle("Continue with Facebook",
                                Image.asset("assets/images/facebook.png")),
                            ButtonStyle("Continue with facebook",
                                Image.asset("assets/images/google.png")),
                            ButtonStyle("Continue with Apple",
                                Image.asset("assets/images/apple.png")),
                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            "Don't have an account?",
                                            style: TextStyle(
                                                color: Color(0xffffffff)),
                                          )),
                                      TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            "Sign up",
                                            style: TextStyle(
                                                color: Color(0xff0080cd)),
                                          ))
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
            onPressed: () {},
            icon: icon,
            label: Align(
                alignment: Alignment.center,
                child: Text(s,
                    style: const TextStyle(color: Color(0xff0080cd))))));
  }
}
