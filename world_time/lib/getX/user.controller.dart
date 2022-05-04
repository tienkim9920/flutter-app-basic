import 'package:get/get.dart';
import 'package:world_time/models/user.model.dart';

class UserController extends GetxController {
  final user = UserModel().obs;

  updateUser(int count) {
    user.update((val) {
      val!.username = 'Nguyen Kim Tien';
      val.count = count + 3;
    });
  }
}
