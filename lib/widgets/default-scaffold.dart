import 'package:flutter/material.dart';
import 'package:zoe/style.dart';

class DefaultScaffold extends StatefulWidget {
  final Widget body;
  DefaultScaffold({required this.body, Key? key}) : super(key: key);

  @override
  State<DefaultScaffold> createState() => _DefaultScaffoldState();
}

class _DefaultScaffoldState extends State<DefaultScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Zoe",
          style: TextStyle(
            color: Style.titleColor,
            fontFamily: "Nunito",
            fontSize: 36,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Style.mainColor,
        elevation: 0,
      ),
      body: widget.body,
    );
  }
}
