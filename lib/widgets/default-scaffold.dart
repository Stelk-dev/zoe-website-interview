import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:zoe/style.dart';

import '../data/DarkMode.dart';

class DefaultScaffold extends StatefulWidget {
  final Widget body;
  DefaultScaffold({required this.body, Key? key}) : super(key: key);

  @override
  State<DefaultScaffold> createState() => _DefaultScaffoldState();
}

class _DefaultScaffoldState extends State<DefaultScaffold> {
  final dk = Get.put(DarkMode());

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
              onPressed: () {
                dk.setDarkMode(!dk.darkMode);
                setState(() {});
              },
              icon: Icon(
                dk.darkMode ? Icons.dark_mode : Icons.dark_mode_outlined,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: widget.body,
    );
  }
}
