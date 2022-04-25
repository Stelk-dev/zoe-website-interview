import 'package:flutter/material.dart';
import 'package:zoe/service/http.dart';
import 'package:zoe/style.dart';
import 'package:zoe/widgets/text-form-field.dart';

class DialogCreatePost extends StatelessWidget {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _content = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (_, setState) => AlertDialog(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Share what you think",
              style: Style.title,
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
          width: 800,
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                AppTextFormField(
                  controller: _title,
                  validator: (v) =>
                      v!.isEmpty ? "Please compile this form" : null,
                  hintText: "Untitled",
                ),
                SizedBox(
                  height: 16,
                ),
                AppTextFormField(
                  controller: _content,
                  validator: (v) =>
                      v!.isEmpty ? "Please compile this form" : null,
                  hintText: "Content...",
                  maxLines: 14,
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
                style: Style.buttonText,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.red,
              ),
              padding: MaterialStateProperty.all(
                EdgeInsets.all(16),
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
                style: Style.buttonText,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.lightBlue,
              ),
              padding: MaterialStateProperty.all(
                EdgeInsets.all(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
