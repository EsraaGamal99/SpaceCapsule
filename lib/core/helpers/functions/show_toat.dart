import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast ({required String msg, required Color? backgroundColor}){
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT, // Duration for which the toast should be shown
    gravity: ToastGravity.CENTER, // Position of the toast message
    timeInSecForIosWeb: 1, // Time in seconds for iOS
    backgroundColor: backgroundColor, // Background color of the toast
    textColor: Colors.black, // Text color of the toast message
    fontSize: 16.0, // Font size of the toast message
  );
}