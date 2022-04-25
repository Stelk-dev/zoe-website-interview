import 'package:get/get.dart';

import '../service/store.dart';

class DarkMode extends GetxController {
  bool darkMode = false;

  Future<void> setDarkMode(bool newValue) async {
    darkMode = newValue;
    update();

    print("Dark mode");
    print(darkMode);

    await LocalStore.writeValueBool(key: "darkmode", value: newValue);
  }
}
