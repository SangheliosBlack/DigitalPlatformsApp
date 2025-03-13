import 'package:flutter/material.dart';

class CustomDialogService {

  static Future<void> showAlertDialog({
    required BuildContext context,
    required Widget content,
  }) {

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(content: content)
    );

  }
  static Future<void> showBottomSheet({
    required BuildContext context,
    required Widget content,
    bool isDismissible = true,
    bool useSafeArea = true,
  }) {

    return showModalBottomSheet(
      context: context,
      isDismissible: isDismissible,
      useSafeArea: useSafeArea,
      builder: (context) => content,
    );
  }

  }

