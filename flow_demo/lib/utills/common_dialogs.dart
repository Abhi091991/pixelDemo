import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'common_widgets.dart';

///To show dialogs
class AlertDialogUtility {
  AlertDialogUtility._();
  static Future<bool?> showAlertDialog(
      BuildContext context,
      String title,
      String defaultActionText,
      ) async {
    ///For Web
    if (kIsWeb) {
        return await showDialog<bool>(
          context: context,
          builder: (context) => Dialog(
            insetPadding: const EdgeInsets.all(0),
            child: Container(
              margin: const EdgeInsets.all(50),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                     const Padding(
                        padding:  EdgeInsets.all(20.0),
                        child:  GetCommonText(title: "Pixel Art", size: 50, color: AppTheme.appLightThemeTextColor, fontWeight: FontWeight.w600),
                      ),
                      Image.network(title,fit: BoxFit.contain,
                          width: MediaQuery.of(context).size.width/2,
                          height: MediaQuery.of(context).size.height/2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextButton(
                          child: const GetCommonText(title: "Cancel", size: 40, color: AppTheme.appLightThemeTextColor, fontWeight: FontWeight.w600),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
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
    ///For Android etc.
    if (!Platform.isIOS) {
      return await showDialog<bool>(
        context: context,
        builder: (context) => Dialog(
          insetPadding: const EdgeInsets.all(0),
          child: Column(
            children: [
              const GetCommonText(title: "Pixel Art", size: 15, color: AppTheme.appLightThemeTextColor, fontWeight: FontWeight.w600),
              Image.network(title,fit: BoxFit.cover,width:MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.height/3),
              TextButton(
                child: const GetCommonText(title: "Cancel", size: 15, color: AppTheme.appLightThemeTextColor, fontWeight: FontWeight.w600),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          ),
        ),
      );
    }
    ///showDialog for ios
    return await showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        content:Column(
          children: [
            const GetCommonText(title: "Pixel Art", size: 15, color: AppTheme.appLightThemeTextColor, fontWeight: FontWeight.w600),
            Image.network(title,fit: BoxFit.cover,width:MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.height/3),
          ],
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: const GetCommonText(title: "Cancel", size: 15, color: AppTheme.appLightThemeTextColor, fontWeight: FontWeight.w600),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      ),
    );
  }
}

