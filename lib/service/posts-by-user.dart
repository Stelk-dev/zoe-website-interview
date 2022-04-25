import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:zoe/models/post-model.dart';
import 'package:zoe/service/store.dart';

class PostByUsers extends GetxController {
  List<Post> postsByUser = [];

  Future<void> updatingPostsByUser() async {
    final response = await LocalStore.getStringValue(key: "PostsByUser");
    if (response == null) return;
    print(response);

    postsByUser.addAll(
      response
          .map(
            (e) => Post.fromJson(e),
          )
          .toList(),
    );
    update();
  }
}
