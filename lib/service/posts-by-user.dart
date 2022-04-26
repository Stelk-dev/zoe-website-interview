import 'dart:convert';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:zoe/models/post-model.dart';
import 'package:zoe/models/user-model.dart';
import 'package:zoe/service/http.dart';
import 'package:zoe/service/store.dart';

// DATA TO DISPLAY IN THE HOME
class DataController extends GetxController {
  final Api _api = Api();
  List<User> users = [];
  List<Post> postsByUser = [];

  Future<void> getUsers() async {
    // ADD A NEW ANONYMOUS USER IF THERE ARE NO ONE
    users.clear();
    if (postsByUser.isNotEmpty && users.indexWhere((e) => e.id == 0) == -1)
      users.add(User.anonymous());

    final response = await _api.getUsers();
    users.addAll(response);

    update();
  }

  // ADDING A NEW POST
  Future<void> addingPostsByUser(Post post) async {
    postsByUser.add(post);

    await LocalStore.writeValueString(
      key: "PostsByUser",
      value: json.encode(
        postsByUser.map((e) => e.toJson()).toList(),
      ),
    );
    await getUsers();

    update();
  }
}
