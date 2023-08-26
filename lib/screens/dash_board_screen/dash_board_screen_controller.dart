

import 'package:get/get.dart';
import 'package:glitzern_login_app/model/user.dart';
import 'package:glitzern_login_app/utils/shared_preference.dart';
import 'package:image_picker/image_picker.dart';

class DashBoardScreenController extends GetxController with StateMixin {
  User? userData;
  String? image;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    change(isLoading.value = true);
    getData();
    // change(isLoading = false);
    super.onInit();
  }

  getData() {
    MySharedPreference.getUser().then((value) {
      if (value != null) {
        userData = value;
        change(userData);
      } else {
        change(isLoading.value = false);
      }
    });
    change(isLoading.value = false);
  }

  Future getImage(ImageSource source) async {
    String imagePath;
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      imagePath = pickedFile.path;
      change(image = imagePath);
    }
    return image;
  }

  Future updateUser() async {
    final user = User(
      name: userData!.name,
      email: userData!.email,
      phone: userData!.phone,
      address: userData!.address,
      userId: userData!.userId,
      password: userData!.password,
      image: image,
    );
    await MySharedPreference.saveUser(user).then((value) => getData());
  }
}
