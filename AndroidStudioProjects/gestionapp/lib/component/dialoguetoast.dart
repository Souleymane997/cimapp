
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as toast;


class DInfo {


  /// fast response for error with automatically close
  static void toastError(String message, {bool isLong = false}) {
    toast.Fluttertoast.showToast(
      msg: message,
      toastLength:
          isLong ? toast.Toast.LENGTH_LONG : toast.Toast.LENGTH_SHORT,
      gravity: toast.ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red[100],
      textColor: Colors.red[900],
      fontSize: 16,
    );
  }

  /// fast response for success with automatically close
  static void toastSuccess(String message, {bool isLong = false}) {
    toast.Fluttertoast.showToast(
      msg: message,
      toastLength:
          isLong ? toast.Toast.LENGTH_LONG : toast.Toast.LENGTH_SHORT,
      gravity: toast.ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green[100],
      textColor: Colors.green[900],
      fontSize: 16,
    );
  }

  /// fast response for netral with automatically close
  static void toastNetral(String message, {bool isLong = false}) {
    toast.Fluttertoast.showToast(
      msg: message,
      toastLength:
          isLong ? toast.Toast.LENGTH_LONG : toast.Toast.LENGTH_SHORT,
      gravity: toast.ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue[100],
      textColor: Colors.blue[900],
      fontSize: 16,
    );
  }

  /// close current active toast
  static void closeToast() {
    toast.Fluttertoast.cancel();
  }
}
