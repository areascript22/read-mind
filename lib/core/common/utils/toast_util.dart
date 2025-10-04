import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

final class ToastMessageUtil {
  static void showToast(String message, BuildContext context) {
    final FToast fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/images/svg/info.svg',
            width: 30,
            height: 30,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.inversePrimary,
              BlendMode.srcIn, // Mantiene el mismo efecto que antes con `color`
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: Theme.of(context).colorScheme.surface,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(milliseconds: 2500), // Custom duration
    );
  }
}
