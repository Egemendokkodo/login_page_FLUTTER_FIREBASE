import 'package:flutter/material.dart';
import 'widgets.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyWidgets().GlassPane(Column(
      children: [
        // bu children ın altına ögeleri ekleyeceğiz
        MyWidgets().TextFieldCustom("Email", TextInputType.emailAddress)
      ],
    ));
  }
}
