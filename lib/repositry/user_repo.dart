import 'package:user_geze/models/user_model.dart';

abstract class UserRepo {
  Future<bool> registerNewUser(UserModel user);
}
