import 'package:flutter/material.dart';

class MyWidgets {
  TextField TextFieldCustom(String s, TextInputType emailAddress) {
    return TextField(
      keyboardType: emailAddress,
      decoration: InputDecoration(
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

  TextButton CustomTextButton(String s, int i) {
    return TextButton(
        onPressed: () {},
        child: Text(
          s,
          style: TextStyle(color: Color(i)),
        ));
  }
}
