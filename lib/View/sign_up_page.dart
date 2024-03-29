import 'package:flutter/material.dart';
import '../Widget/widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, this.controller, this.labelText});
  final TextEditingController? controller;
  final String? labelText;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscureText = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyWidgets().GlassPaneForSignUpPage(
        PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: MyWidgets().MyAppBar(context),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // bu children ın altına ögeleri ekleyeceğiz

            MyWidgets().TextFieldCustom(emailController, "Email",
                TextInputType.emailAddress, Icons.email),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: MyWidgets().TextFieldCustom(usernameController, "Username",
                  TextInputType.emailAddress, Icons.account_box_rounded),
            ),

            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      width: 165,
                      child: MyWidgets().TextFieldCustom(nameController, "Name",
                          TextInputType.name, Icons.person)),
                  SizedBox(
                      width: 165,
                      child: MyWidgets().TextFieldCustom(surnameController,
                          "Surname", TextInputType.name, Icons.person)),
                ],
              ),
            ),

            Container(
                margin: const EdgeInsets.only(top: 10),
                child: MyPasswordInputText("Password", passwordController)),
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: MyPasswordInputText(
                    "Re-enter password", rePasswordController)),
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: MyWidgets().MyElevatedButtonSendData(
                    context,
                    "Sign Up",
                    emailController,
                    passwordController,
                    nameController,
                    surnameController,
                    usernameController,
                    rePasswordController)),
          ],
        ));
  }

  TextField MyPasswordInputText(String s, TextEditingController? controller) {
    return TextField(
      controller: controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
        hintText: s,
        labelText: widget.labelText,
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
