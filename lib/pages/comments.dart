import 'package:flutter/material.dart';
import 'package:zoe/models/comments-model.dart';
import 'package:zoe/models/post-model.dart';
import 'package:zoe/models/user-model.dart';
import 'package:zoe/service/scroll-behavior.dart';
import 'package:zoe/widgets/default-scaffold.dart';
import 'package:zoe/widgets/post-box.dart';

import '../service/http.dart';
import '../style.dart';

class CommentsSection extends StatefulWidget {
  final User user;
  final Post post;
  const CommentsSection({required this.user, required this.post, Key? key})
      : super(key: key);

  @override
  State<CommentsSection> createState() => _CommentsSectionState();
}

class _CommentsSectionState extends State<CommentsSection> {
  final Api _api = Api();

  late Post _post;
  late User _user;
  List<Comments>? _comments;

  Future<void> _getComments() async {
    _comments = await _api.getCommentsFromPost(_post.id);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _post = widget.post;
    _user = widget.user;

    _getComments();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: _comments == null
          ? Center(
              child: CircularProgressIndicator(
                color: Style.mainColor,
              ),
            )
          : ScrollConfiguration(
              behavior: MyBehavior(),
              child: SingleChildScrollView(
                child: Center(
                  child: Container(
                    width: 800,
                    decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(color: Style.mainColor, width: 1),
                          right: BorderSide(color: Style.mainColor, width: 1),
                          bottom: _comments!.isEmpty
                              ? BorderSide(color: Style.mainColor, width: 0)
                              : BorderSide(color: Style.mainColor, width: 1)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 400,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // User nickname row
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: Style.greyColor,
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
                                      _user.username,
                                      style: Style.username,
                                    ),
                                    Text(
                                      " / ${_user.name}",
                                      style: Style.name,
                                    ),
                                  ],
                                ),
                              ),

                              // Post box
                              Expanded(
                                child: PostBox(
                                  post: _post,
                                ),
                              ),
                            ],
                          ),
                        ),

                        _comments!.isEmpty
                            ? Container()
                            : Divider(
                                color: Style.mainColor,
                              ),

                        // Comments
                        ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (_, __) => Divider(),
                          itemCount: _comments!.length,
                          itemBuilder: (_, i) => Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  _comments![i].name,
                                  style: Style.nameComment,
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  _comments![i].body,
                                  style: Style.contentComment,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
