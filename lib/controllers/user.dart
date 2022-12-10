import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:qfoumn/model/user.dart';

class UserController extends GetxService {
  Rx<UserModel> userData = UserModel(email: "", googleId: "").obs;
}
