import 'package:flutter/material.dart';
import 'package:zoe/style.dart';

class DefaultScaffold extends StatelessWidget {
  final Widget body;
  const DefaultScaffold({required this.body, Key? key}) : super(key: key);

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
      body: body,
    );
  }
}
