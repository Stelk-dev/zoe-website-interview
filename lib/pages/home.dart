import 'package:flutter/material.dart';
import 'package:zoe/service/scroll-behavior.dart';
import 'package:zoe/widgets/dialog-create-post.dart';
import '../models/user-model.dart';
import '../service/http.dart';
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

  Future<void> _getUsers() async {
    _users = await _api.getUsers();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _users.isEmpty
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
