import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoaderIndicator extends StatelessWidget {
  final String? message;
  final Color? backgroundColor;
  final Color? spinnerColor;
  final double? spinnerSize;
  final double? opacity;

  const LoaderIndicator({
    super.key,
    this.message,
    this.backgroundColor,
    this.spinnerColor,
    this.spinnerSize = 40.0,
    this.opacity = 0.7,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: spinnerSize,
      height: spinnerSize,
      child: Lottie.asset(
        'assets/images/animations/loading_dots.json',
        fit: BoxFit.contain,
        repeat: true,
      ),
    );
  }
}
