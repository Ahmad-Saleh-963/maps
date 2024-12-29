import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:sport/library/utils/single_service_context.dart';

class ShowToastHelper {
  static Color _getColorByType(ToastType type) {
    if (type == ToastType.success) {
      return Colors.green;
    } else if (type == ToastType.error) {
      return Colors.red;
    } else if (type == ToastType.warning) {
      return Colors.orange;
    } else if (type == ToastType.info) {
      return Colors.black54;
    } else {
      return Colors.black;
    }
  }

  static void show(String msg, ToastType type, {bool long = false}) {
    var context =  SingleInstanceService.navigatorKey.currentContext!;
    BotToast.showText(
        align: Alignment.bottomCenter,
        text: msg,
        textStyle:
        const TextStyle(color: Colors.white),
        duration: (long || msg.length > 40)
            ? const Duration(seconds: 3)
            : const Duration(seconds: 2),
        contentColor: _getColorByType(type));
  }
}

class ToastMessage {
  String msg;
  Map<String, List<String>>? validations;
  ToastType type;
  bool long;
  dynamic data;

  ToastMessage(
      this.msg,
      this.type, {
        this.long = false,
        this.data,
        this.validations,
      });
}

enum ToastType{
  success,
  info,
  warning,
  error
}