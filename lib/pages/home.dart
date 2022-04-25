import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:zoe/models/user-model.dart';
import 'package:zoe/service/posts-by-user.dart';
import 'package:zoe/service/http.dart';
import 'package:zoe/service/scroll-behavior.dart';
import 'package:zoe/widgets/dialog-create-post.dart';
import '../style.dart';
import '../widgets/post-widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Api _api = Api();
  List<User> _users = [];
  final PostByUsers _postByUsers = Get.put(PostByUsers());

  Future<void> _getUsers() async {
    await _getPostByUsers();
    if (_postByUsers.postsByUser.isNotEmpty) _users.add(User.anonymous());

    _users = await _api.getUsers();
    setState(() {});
  }

  Future<void> _getPostByUsers() async {
    await _postByUsers.updatingPostsByUser();
  }

  @override
  void initState() {
    super.initState();
    _getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<PostByUsers>(
        builder: (_) => _users.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: Style.mainColor,
                ),
              )
            : ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                  child: Center(
                    child: Container(
                      width: 800,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          left: BorderSide(color: Style.mainColor, width: 1),
                          right: BorderSide(color: Style.mainColor, width: 1),
                        ),
                      ),
                      child: ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: _users.length,
                        itemBuilder: (_, i) => PostWidget(
                          user: _users[i],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => DialogCreatePost(),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Style.secondaryColor,
      ),
    );
  }
}
