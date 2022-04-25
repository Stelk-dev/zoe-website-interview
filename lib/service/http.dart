import 'package:dio/dio.dart';
import 'package:zoe/models/comments-model.dart';
import 'package:zoe/models/post-model.dart';
import 'package:zoe/models/user-model.dart';

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
      final data = response.data as List<Map<String, dynamic>>;

      comments = List<Comments>.from(data);
      print("🟢 [http.dart] Getting comments");
    } catch (e) {
      print("🔴 [http.dart] Getting comments:\n $e");
    }

    return comments;
  }
}
