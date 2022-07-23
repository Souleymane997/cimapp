import 'dart:async';

import 'package:cimapp/models/slidepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart' as _toast;
import 'package:get/get.dart' as _getx;

import '../widgets/screens/missionScreens/listing.dart';
import 'colors.dart';
import 'custom_text.dart';

class DInfo {
  /// dialog for chek confirmation
  /// return true if yes
  /// retun false if no
  static Future<bool> dialogConfirmation(
    BuildContext context,
    String title,
    String content, {
    String textNo = 'NON',
    String textYes = 'OUI',
  }) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(textNo),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(textYes),
            ),
          ],
        );
      },
    );
  }

  /// dialog for response error
  /// not automatically closed, so you have to use DInfo.close() after this
  static void dialogError(BuildContext context, String message) {
    _getx.Get.dialog(
      SimpleDialog(
        children: [
          Center(
            child: Icon(
              Icons.error_outline_outlined,
              color: Colors.red[700],
              size: 40,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            message,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Container(
              width: 70,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: bleuClaire(),
              ),
              child: CustomText(
                'fermer',
                color: blanc(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
      barrierDismissible: true,
    );
  }

  /// fast response for error with automatically close
  static void toastError(String message, {bool isLong = false}) {
    _toast.Fluttertoast.showToast(
      msg: message,
      toastLength:
          isLong ? _toast.Toast.LENGTH_LONG : _toast.Toast.LENGTH_SHORT,
      gravity: _toast.ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red[100],
      textColor: Colors.red[900],
      fontSize: 16,
    );
  }

  /// fast response for success with automatically close
  static void toastSuccess(String message, {bool isLong = false}) {
    _toast.Fluttertoast.showToast(
      msg: message,
      toastLength:
          isLong ? _toast.Toast.LENGTH_LONG : _toast.Toast.LENGTH_SHORT,
      gravity: _toast.ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green[100],
      textColor: Colors.green[900],
      fontSize: 16,
    );
  }

  /// fast response for netral with automatically close
  static void toastNetral(String message, {bool isLong = false}) {
    _toast.Fluttertoast.showToast(
      msg: message,
      toastLength:
          isLong ? _toast.Toast.LENGTH_LONG : _toast.Toast.LENGTH_SHORT,
      gravity: _toast.ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue[100],
      textColor: Colors.blue[900],
      fontSize: 16,
    );
  }

  /// close current active toast
  static void closeToast() {
    _toast.Fluttertoast.cancel();
  }
}

confirmeDialogue(BuildContext context, String message, int x, Function a) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          contentPadding: const EdgeInsets.only(top: 10.0),
          content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10.0, 5.0, 5.0, 10.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: CustomText(
                          message,
                          tex: TailleText(context).soustitre,
                          color: noir(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
          actions: [
            ElevatedButton(
                child: CustomText(
                  "NON",
                  color: bleuClaire(),
                  tex: TailleText(context).contenu,
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 1.0),
                  primary: Colors.white,
                  onPrimary: Colors.white,
                  shadowColor: bleuFonce(),
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            const SizedBox(width: 7.5),
            ElevatedButton(
                child: CustomText(
                  "OUI",
                  color: blanc(),
                  tex: TailleText(context).contenu,
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 1.0),
                  primary: bleuClaire(),
                  onPrimary: bleuClaire(),
                  shadowColor: bleuFonce(),
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                ),
                onPressed: () {
                  a();
                  Navigator.pop(context);

                  Navigator.of(context).pop(
                    SlideRightRoute(
                        child: ListingMission(x: x),
                        page: ListingMission(x: x),
                        direction: AxisDirection.left),
                  );
                }),
            const SizedBox(width: 2.5),
          ],
        );
      });
}

initNotify(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) {
  var initializationSettingsAndroid =
      const AndroidInitializationSettings('uc_launcher');
  var initializationSettingsIOs = const IOSInitializationSettings();
  var initSetttings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOs);

  flutterLocalNotificationsPlugin.initialize(initSetttings);
}

showNotification(
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
  var android = const AndroidNotificationDetails('id', 'channel ',
      channelDescription: 'description',
      priority: Priority.high,
      importance: Importance.max);
  var iOS = const IOSNotificationDetails();
  var platform = NotificationDetails(android: android, iOS: iOS);
  await flutterLocalNotificationsPlugin.show(0, " CIMAPP Notifications ",
      "Une nouvelle mission vient d'être approuvé ", platform,
      payload: "Une nouvelle mission vient d'etre approuvé ");
}
