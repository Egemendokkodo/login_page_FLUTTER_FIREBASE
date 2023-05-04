import 'package:flutter/material.dart';
import 'package:login_page_design/Firebase/database_operations.dart';
import 'package:login_page_design/Widget/widgets.dart';

class EnterPasswordPage extends StatefulWidget {
  final Map<String, dynamic> userData;

  const EnterPasswordPage({Key? key, required this.userData}) : super(key: key);

  @override
  State<EnterPasswordPage> createState() => _EnterPasswordPageState();
}

class _EnterPasswordPageState extends State<EnterPasswordPage> {
  bool _obscureText = true;
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String email = widget.userData['email'];
    String name = widget.userData['name'];
    String surname = widget.userData['surname'];

    return MyWidgets().GlassPaneForEnterPasswordPage(
        PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: MyWidgets().MyAppBar(context),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 17),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Text(
                                "$name $surname",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(email,
                                style: const TextStyle(color: Colors.white))
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 25),
                    child: Column(
                      children: [
                        MyPasswordInputText("password", passwordController),
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
                            onPressed: () {
                              DatabaseOperations().nextLoginTransaction(
                                  context, email, passwordController.text);
                            },
                            child: const Text(
                              "Log in",
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xfff0ffff)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot your password?",
                          style: TextStyle(color: Color(0xff0080cd)),
                        )),
                  ),
                ],
              ),
            ),
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
        //labelText: "password",
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
