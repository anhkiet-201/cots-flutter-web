import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension BaseSnackBar on BuildContext {
  void showSnackBar(String text, {SnackBarType type = SnackBarType.success}) {
    ScaffoldMessenger.maybeOf(this)?.showSnackBar(
      SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        width: 350,
        backgroundColor: Colors.transparent,
        content: Container(
          width: 350,
          padding: const EdgeInsets.all(10),
          constraints: const BoxConstraints(
            maxHeight: 110
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(1,1),
                blurRadius: 5,
                spreadRadius: 2
              )
            ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(type.icon, color: type.color,),
                  const SizedBox(width: 5,),
                  Text(
                    type.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}

enum SnackBarType {
  success,
  error;

  IconData get icon {
    switch(this) {
      case SnackBarType.error: return Icons.error_outline_rounded;
      case SnackBarType.success: return Icons.check;
    }
  }

  Color get color {
    switch(this) {
      case SnackBarType.error: return CupertinoColors.systemRed;
      case SnackBarType.success: return CupertinoColors.systemGreen;
    }
  }

  String get title {
    switch(this) {
      case SnackBarType.error: return 'Error';
      case SnackBarType.success: return 'Success';
    }
  }
}