import 'package:flutter/cupertino.dart';

void showAlertDialog(BuildContext context, String content) {
  showCupertinoDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        content: Text(content,
          style: const TextStyle(fontWeight: FontWeight.w400,
              fontFamily:"Poppins",fontSize:20.0),
        ),
        actions: [
          CupertinoDialogAction(
              child: const Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          CupertinoDialogAction(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );
    },
  );
}
