import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_page_design/View/enter_password_page.dart';
import 'package:login_page_design/Widget/widgets.dart';

class DatabaseOperations {
  final ref = FirebaseFirestore.instance.collection("users");

  Future addUser(String email, String password, String name, String surname,
      String username) async {
    final json = {
      "name": name,
      "surname": surname,
      "email": email,
      "password": password,
      "username": username
    };
    await ref.doc(email).set(json);
  }

  Future checkCredentials(context, String email, String password, String name,
      String surname, String username, String rePassword) async {
    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(email).get();

    if (documentSnapshot.exists) {
      MyWidgets().MySnackbar(context, "email already exists.");
    }
    if (password != rePassword) {
      MyWidgets().MySnackbar(context, "passwords does not match.");
    } else {
      FirebaseFirestore.instance
          .collection('users')
          .get()
          .then((querySnapshot) {
        for (var doc in querySnapshot.docs) {
          if (doc.data()['name'] == name) {
            MyWidgets().MySnackbar(context, "username already exists.");
            break;
          } else {
            addUser(email, password, name, surname, username);
          }
        }
      });
    }
  }

  Future loginTransaction(BuildContext context, String email) async {
    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(email).get();
    if (email.isNotEmpty) {
      if (documentSnapshot.exists) {
        final data = documentSnapshot.data();
        final name = data?['name'];
        final surname = data?['surname'];

        final userData = {'email': email, 'name': name, 'surname': surname};
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => EnterPasswordPage(userData: userData)),
        );
      } else {
        MyWidgets().MySnackbar(context, "invalid email.");
      }
    } else {
      MyWidgets().MySnackbar(context, "invalid email.");
    }
  }

  Future nextLoginTransaction(
      BuildContext context, String email, String password) async {
    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(email).get();

    if (documentSnapshot.exists) {
      final data = documentSnapshot.data();
      final passwordFromDb = data?['password'];

      if (password == passwordFromDb.toString()) {

        MyWidgets().MySnackbar(
            context, "login is succesfull");
      }else {
      MyWidgets().MySnackbar(context, "invalid password.");

    }
    }
  }
}
