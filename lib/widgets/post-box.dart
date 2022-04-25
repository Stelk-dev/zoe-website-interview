import 'package:flutter/material.dart';
import 'package:zoe/models/post-model.dart';
import 'package:zoe/style.dart';

class PostBox extends StatelessWidget {
  final Post post;
  const PostBox({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 70),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            post.title,
            style: Style.titlePost,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 34,
          ),
          Text(
            post.body,
            style: Style.contentPost,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
