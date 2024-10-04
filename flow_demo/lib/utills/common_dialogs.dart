import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AlertDialogUtility {
  AlertDialogUtility._();
  static Future<bool?> showAlertDialog(
      BuildContext context,
      String title,
      String defaultActionText,
      ) async {
    if (!Platform.isIOS) {
      return await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(title),
          actions: <Widget>[
            TextButton(
              child: Text(defaultActionText),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        ),
      );
    }
    ///showDialog for ios
    return await showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        content: Text(title),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(defaultActionText),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      ),
    );
  }
}