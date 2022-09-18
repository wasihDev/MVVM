import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
// FocusNode for TextField
  static void fieldFocussChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

// toast function
  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

// FlushBar function
  static void flushbarErrorMsg(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
            reverseAnimationCurve: Curves.easeInOut,
            flushbarPosition: FlushbarPosition.TOP,
            forwardAnimationCurve: Curves.decelerate,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            padding: const EdgeInsets.all(15),
            positionOffset: 20,
            icon: const Icon(Icons.error, size: 28, color: Colors.white),
            message: message,
            messageColor: Colors.white,
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
            borderRadius: BorderRadius.circular(20),
            title: "Error")
          ..show(context));
  }

  static void flushbarSuccessfulMsg(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
            reverseAnimationCurve: Curves.easeInOut,
            flushbarPosition: FlushbarPosition.TOP,
            forwardAnimationCurve: Curves.decelerate,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            padding: const EdgeInsets.all(15),
            positionOffset: 20,
            icon: const Icon(Icons.error, size: 28, color: Colors.white),
            message: message,
            messageColor: Colors.white,
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 3),
            borderRadius: BorderRadius.circular(20),
            title: "Enter Succesfully")
          ..show(context));
  }

  // SnackBar function
  static snakBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text(message)));
  }
}
