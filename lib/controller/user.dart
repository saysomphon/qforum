import 'package:get/get.dart';
import 'package:qfoumn/model/user.dart';

class UserController extends GetxService {
  Rx<UserModel> userData = UserModel(email: "", googleId: "").obs;
}
