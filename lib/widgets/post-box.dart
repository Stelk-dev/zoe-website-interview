import 'package:flutter/material.dart';
import 'package:zoe/models/post-model.dart';

class PostBox extends StatelessWidget {
  final Post post;
  const PostBox({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 600,
        height: 200,
        child: Column(
          children: [
            Text(
              post.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 34,
            ),
            Text(
              post.body,
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
