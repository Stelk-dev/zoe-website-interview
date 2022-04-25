import 'package:flutter/material.dart';
import 'package:zoe/service/http.dart';

class DialogCreatePost extends StatelessWidget {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _content = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (_, setState) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Share what you think",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            _loading
                ? SizedBox(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : SizedBox(),
          ],
        ),
        actionsPadding: EdgeInsets.only(bottom: 8, right: 16),
        content: SizedBox(
          width: MediaQuery.of(context).size.width * .7,
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  validator: (v) =>
                      v!.isEmpty ? "Please compile this form" : null,
                  decoration: InputDecoration(
                    hintText: "Untitled",
                    hintStyle: TextStyle(fontWeight: FontWeight.normal),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(width: 2, color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _content,
                  validator: (v) =>
                      v!.isEmpty ? "Please compile this form" : null,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: "Content",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(width: 2, color: Colors.grey),
                    ),
                  ),
                  maxLines: 18,
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: SizedBox(
              width: 100,
              child: Text(
                "Cancel",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                EdgeInsets.all(16),
              ),
              overlayColor: MaterialStateProperty.all(
                Colors.red.withOpacity(.1),
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              if (_key.currentState!.validate()) {
                setState(() => _loading = true);
                await Api().addPost(_title.text, _content.text, context);

                setState(() => _loading = false);
              }
            },
            child: SizedBox(
              width: 100,
              child: Text(
                "Post",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                EdgeInsets.all(16),
              ),
              overlayColor: MaterialStateProperty.all(
                Colors.lightBlue.withOpacity(.1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
