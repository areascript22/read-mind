import 'package:flutter/material.dart';

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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: spinnerSize,
              height: spinnerSize,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  spinnerColor ?? Theme.of(context).colorScheme.primary,
                ),
                strokeWidth: 3.0,
              ),
            ),
            if (message != null) ...[
              const SizedBox(height: 16),
              Text(
                message!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
