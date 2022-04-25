import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:zoe/models/comments-model.dart';
import 'package:zoe/models/post-model.dart';
import 'package:zoe/models/user-model.dart';
import 'package:zoe/service/posts-by-user.dart';
import 'package:zoe/service/store.dart';

class Api {
  final _dio = Dio(
    BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com",
    ),
  );

  // Get Posts
  Future<List<User>> getUsers() async {
    print("🛠 [http.dart] Getting users...");
    List<User> users = [];

    try {
      final response = await _dio.get("/users");
      final data = response.data as List<dynamic>;

      users = data.map((e) => User.fromJson(e)).toList();

      print("🟢 [http.dart] Get users: ${users.length}");
    } catch (e) {
      print("🔴 [http.dart] Get users  Error:\n $e");
    }

    return users;
  }

  // Get Posts
  Future<List<Post>> getPostsByUserId(int userId) async {
    print("🛠 [http.dart] Getting posts...");
    // Group of posts added with the same user
    List<Post> posts = [];

    try {
      final response = await _dio.get("/posts?userId=$userId");
      final data = response.data as List<dynamic>;

      posts = data.map((e) => Post.fromJson(e)).toList();

      print("🟢 [http.dart] Get posts: ${posts.length}");
    } catch (e) {
      print("🔴 [http.dart] Get posts  Error:\n $e");
    }

    return posts;
  }

  // Get user
  // Future<User?> getUserInformation(int userId) async {
  //   print("🛠 [http.dart] Getting user information: $userId...");
  //   User? user;

  //   try {
  //     final response = await _dio.get("/users/$userId");
  //     final data = response.data as Map<String, dynamic>;

  //     if (data.isEmpty) return User.anonymous();

  //     user = User.fromJson(data);
  //     print("🟢 [http.dart] Getting user");
  //   } catch (e) {
  //     print("🔴 [http.dart] Getting user:\n $e");
  //   }

  //   return user;
  // }

  // Get comments
  Future<List<Comments>> getCommentsFromPost(int postId) async {
    print("🛠 [http.dart] Getting comments from post: $postId...");
    List<Comments> comments = [];

    try {
      final response = await _dio.get("/posts/$postId/comments");
      final data = response.data as List<dynamic>;

      comments = data.map((e) => Comments.fromJson(e)).toList();
      print("🟢 [http.dart] Getting comments");
    } catch (e) {
      print("🔴 [http.dart] Getting comments:\n $e");
    }

    return comments;
  }

  // Get comments
  Future<void> addPost(String title, String body, BuildContext context) async {
    print("🛠 [http.dart] Adding...");

    try {
      final response = await _dio.post(
        "/posts",
        data: {
          "title": title,
          "body": body,
          "userId": 0,
        },
        options: Options(
          headers: {
            'Content-type': 'application/json; charset=UTF-8',
          },
        ),
      );

      // SAVING POSTS BY USERS LOCALLY
      final PostByUsers _data = Get.put(PostByUsers());
      _data.postsByUser.add(
        Post.fromJson(
          response.data,
        ),
      );

      await LocalStore.writeValueString(
        key: "PostsByUser",
        value: json.encode(
          _data.postsByUser
              .map(
                (e) => e.toJson(),
              )
              .toList(),
        ),
      );
      _data.update();

      showFlash(
        context: context,
        duration: Duration(milliseconds: 3500),
        builder: (_, controller) => Flash(
          controller: controller,
          behavior: FlashBehavior.floating,
          position: FlashPosition.bottom,
          backgroundColor: Colors.green,
          boxShadows: kElevationToShadow[4],
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          child: FlashBar(
            content: Text(
              'Your post was successfully added!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      );
      Navigator.of(context).pop();

      print("🟢 [http.dart] Post added");
    } catch (e) {
      print("🔴 [http.dart] Post added:\n $e");

      showFlash(
        context: context,
        duration: Duration(milliseconds: 3500),
        builder: (_, controller) => Flash(
          controller: controller,
          behavior: FlashBehavior.floating,
          position: FlashPosition.bottom,
          backgroundColor: Colors.red,
          boxShadows: kElevationToShadow[4],
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          child: FlashBar(
            content: Text(
              'Something went wrong... try again',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      );
    }
  }
}
