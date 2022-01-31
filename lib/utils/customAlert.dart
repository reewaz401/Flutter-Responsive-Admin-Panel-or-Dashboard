import 'package:flutter/material.dart';

dynamic customAlert(
    {required BuildContext ctx,
    required String title,
    required String content}) {
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: [
      MaterialButton(
        onPressed: () => Navigator.of(ctx).pop(),
        child: Text('Ok'),
      ),
    ],
  );

  // show the dialog
  return showDialog(
    context: ctx,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

dynamic customCallAlert({required BuildContext ctx, required int status}) {
  AlertDialog alert = AlertDialog(
    title: Text(status == 200
        ? 'Done'
        : status == 401
            ? "Not Found"
            : "Error"),
    content: Text(status.toString()),
    actions: [
      MaterialButton(
        onPressed: () => Navigator.of(ctx).pop(),
        child: Text('Ok'),
      ),
    ],
  );

  // show the dialog
  return showDialog(
    context: ctx,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
