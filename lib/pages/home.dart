import 'package:flutter/material.dart';

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
    print(_users);
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
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Zoe",
          style: TextStyle(
            color: Style.titleColor,
          ),
        ),
        backgroundColor: Style.mainColor,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.dark_mode_outlined,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: _users.isEmpty
          ? Center(
              child: CircularProgressIndicator(
                color: Style.mainColor,
              ),
            )
          : SingleChildScrollView(
              child: Center(
                child: Container(
                  width: 800,
                  decoration: BoxDecoration(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Style.mainColor,
      ),
    );
  }
}
