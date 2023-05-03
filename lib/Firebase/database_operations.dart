import 'package:cloud_firestore/cloud_firestore.dart';
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
          }else{
            addUser(email, password, name, surname, username);
          }
        }
      });
    }
  }
}
