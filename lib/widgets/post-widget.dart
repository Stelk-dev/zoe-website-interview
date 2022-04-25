import 'package:flutter/material.dart';
import 'package:zoe/models/post-model.dart';
import 'package:zoe/models/user-model.dart';
import 'package:zoe/style.dart';

import '../service/http.dart';

class PostWidget extends StatefulWidget {
  final User user;
  const PostWidget({required this.user, Key? key}) : super(key: key);

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  final Api _api = Api();
  late User user;

  int index = 0;
  List<Post> _posts = [];
  final PageController _controller = PageController();

  Future<void> _getPosts() async {
    _posts = await _api.getPostsByUserId(user.id);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    user = widget.user;

    _getPosts();
  }

  Widget _postBox(Post post) {
    return Center(
      child: Container(
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _posts.isEmpty
          ? Center(
              child: CircularProgressIndicator(
                color: Style.mainColor,
              ),
            )
          : MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                height: 500,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.person,
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            user.username,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            " / ${user.name}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black26,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: PageView.builder(
                              controller: _controller,
                              itemCount: _posts.length,
                              itemBuilder: (_, index) => _postBox(
                                _posts[index],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (int i = 0; i < _posts.length; i++)
                                  Container(
                                    height: 8,
                                    width: 8,
                                    margin: EdgeInsets.symmetric(horizontal: 4),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: index == i
                                          ? Colors.black
                                          : Colors.black12,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Align(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      if (index == 0) return;

                                      _controller.previousPage(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeInOut,
                                      );

                                      setState(() => index -= 1);
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      color: index == 0
                                          ? Colors.black26
                                          : Colors.black,
                                    ),
                                    iconSize: 30,
                                    splashRadius: index == 0 ? 1 : 30,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      if (index == (_posts.length - 1)) return;

                                      _controller.nextPage(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeInOut,
                                      );

                                      setState(() => index += 1);
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: index == (_posts.length - 1)
                                          ? Colors.black26
                                          : Colors.black,
                                    ),
                                    iconSize: 30,
                                    splashRadius:
                                        index == (_posts.length - 1) ? 1 : 30,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
