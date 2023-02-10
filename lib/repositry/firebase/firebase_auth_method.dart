import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_geze/models/user_model.dart';
import 'package:user_geze/repositry/firebase/firebase_storage_methods.dart';

class FirebaseAuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String firstName,
    required String lastName,
    required String password,
    required String email,
  }) async {
    String res = "some error has occured";
    try {
      if (firstName.isNotEmpty ||
          lastName.isNotEmpty ||
          password.isNotEmpty ||
          email.isNotEmpty) {
        // register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);

        // String photoURL = await FirebaseStorageMethods()
        //     .uploadImageToStorage("profile pics", file);
        UserModel user = UserModel(
          identification: cred.user!.uid,
          firstName: firstName,
          lastName: lastName,
          userCreated: DateTime.now().toString().substring(0, 10),
          email: email,
        );
        // add user to database(firestore)

        await _firestore
            .collection("users2")
            .doc(cred.user!.uid)
            .set(user.toMap());
        // await _firestore.collection("users").doc(cred.user!.uid).set({
        //   'uid': cred.user!.uid,
        //   'firstName': firstName,
        //   'lastName': lastName,
        //   'email': email,
        //   'photoURL': photoURL
        // });
        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = "Some error has occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "Success";
      } else {
        res = "Please Enter All Fields";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<UserModel> getUserDetail() async {
    final snap =
        await _firestore.collection("users2").doc(_auth.currentUser!.uid).get();

    Map<String, dynamic>? userData = snap.data();

    return UserModel.fromMap(userData!);
  }
}
