import 'dart:io';
import 'package:cashrich_assignment/utils/custom_dimensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

void showSnackBar(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

BuildContext? _dialogContext;

closeLoader() {
  if (_dialogContext != null) {
    Navigator.pop(_dialogContext!);
    _dialogContext = null;
  }
}

Future<void> startLoader(BuildContext context) async {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (buildContext) {
      _dialogContext = buildContext;
      return Dialog(
        child: Container(
          color: Colors.white,
          height: px_100,
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(spacing_xxl_2),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    },
  );
}

void customPrinter(String msg) {
  if (kDebugMode) {
    print(msg);
  }
}

Future<bool> isConnected() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    return false;
  }
}

String dateFormatToString(DateTime? dateTime){
  if(dateTime==null){
    return '';
  }
  return DateFormat('dd-mm-yyyy hh:mm a').format(dateTime);
}
