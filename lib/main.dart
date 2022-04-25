import 'package:flutter/material.dart';
import 'package:zoe/http.dart';
import 'package:zoe/style.dart';

import 'models/Post-Model.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Api _api = Api();
  List<Map<String, dynamic>> _posts = [];

  Future<void> _test() async {
    _posts = await _api.getPosts();
    for (var i in _posts) {
      print("${i["user"].id} = ${i["posts"]}");
    }
  }

  @override
  void initState() {
    super.initState();
    _test();
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
      ),
      body: Center(
        child: Text("Test"),
      ),
    );
  }
}
