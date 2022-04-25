class Comments {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  const Comments({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  static Comments fromJson(Map map) {
    return Comments(
      postId: map["postId"],
      id: map["id"],
      name: map["name"],
      email: map["email"],
      body: map["body"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "postId": postId,
      "id": id,
      "name": name,
      "email": email,
      "body": body,
    };
  }
}
