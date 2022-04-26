import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:zoe/service/posts-by-user.dart';
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
  final DataController _dataController = Get.put(DataController());

  Future<void> _getUsers() async {
    await _dataController.getUsers();
  }

  @override
  void initState() {
    super.initState();
    _getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DataController>(
        builder: (_) => _dataController.users.isEmpty
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
                      child: Column(
                        children: [
                          _dataController.users[0].id == 0
                              ? PostWidget(
                                  user: _dataController.users[0],
                                )
                              : Container(),
                          ListView.separated(
                            shrinkWrap: true,
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: _dataController.users.length,
                            itemBuilder: (_, i) => PostWidget(
                              user: _dataController.users[i],
                            ),
                          ),
                        ],
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
