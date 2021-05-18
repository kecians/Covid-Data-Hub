import 'package:flutter/material.dart';

  void showToast(BuildContext context,text) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }
