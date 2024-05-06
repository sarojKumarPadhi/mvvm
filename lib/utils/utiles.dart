import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          duration: const Duration(seconds: 3),
          forwardAnimationCurve: Curves.bounceIn,
          padding: const EdgeInsets.all(15),
          borderRadius: BorderRadius.circular(8),
          backgroundColor: Colors.red,
          reverseAnimationCurve: Curves.bounceInOut,
          positionOffset: 20,
          icon: const Icon(Icons.error),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          message: message,
        )..show(context));
  }

  static SnakBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text(message)));
  }
}
