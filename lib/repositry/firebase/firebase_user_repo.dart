import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_geze/models/user_model.dart';
import 'package:user_geze/repositry/user_repo.dart';

class FirebaseUserRepo extends UserRepo {
  @override
  Future<bool> registerNewUser(UserModel user) async {
    print("in firestore");
    try {
      await FirebaseFirestore.instance
          .collection(user.identification)
          .doc(user.identification)
          .set(user.toMap());
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  // Future<UserModel> getUserDetail() async {
  //   final snap = await FirebaseFirestore.instance
  //       .collection(FirebaseAuth.instance.currentUser!.uid)
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get();

  //   Map<String, dynamic>? userData = snap.data();

  //   return UserModel.fromMap(userData!);
  // }
}
