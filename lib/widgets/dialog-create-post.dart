import 'package:flutter/material.dart';

class DialogCreatePost extends StatelessWidget {
  const DialogCreatePost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Share what you think",
        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
      ),
      actionsPadding: EdgeInsets.only(bottom: 8, right: 16),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * .7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              style: TextStyle(fontWeight: FontWeight.bold),
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
          onPressed: () {},
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
    );
  }
}
