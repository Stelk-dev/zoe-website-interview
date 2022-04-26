import 'package:dio/dio.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:zoe/models/comments-model.dart';
import 'package:zoe/models/post-model.dart';
import 'package:zoe/models/user-model.dart';
import 'package:zoe/service/posts-by-user.dart';
import 'package:zoe/widgets/pop-up-response.dart';

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

  // Get Posts by user Id
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

  // Add a post
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
      final DataController _data = Get.put(DataController());
      await _data.addingPostsByUser(
        Post.fromJson(response.data),
      );

      PopUpResponse.showPopUp(
        title: "Your post was successfully added!",
        color: Colors.green,
        context: context,
      );

      Navigator.of(context).pop();

      print("🟢 [http.dart] Post added");
    } catch (e) {
      print("🔴 [http.dart] Post added:\n $e");

      PopUpResponse.showPopUp(
        title: "Something went wrong... try again",
        color: Colors.red,
        context: context,
      );
    }
  }
}
