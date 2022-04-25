import 'package:flutter/material.dart';
import 'package:zoe/pages/home.dart';
import 'package:zoe/service/scroll-behavior.dart';
import 'package:zoe/widgets/default-scaffold.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      scrollBehavior: NoThumbScrollBehavior().copyWith(scrollbars: false),
      home: DefaultScaffold(
        body: Home(),
      ),
    ),
  );
}
