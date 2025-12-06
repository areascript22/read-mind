import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieLoader extends StatelessWidget {
  final double size;
  final String assetPath;
  final bool repeat;

  const LottieLoader({
    super.key,
    required this.size,
    this.assetPath = 'assets/images/animations/loading.json',
    this.repeat = true,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: Lottie.asset(assetPath, fit: BoxFit.contain, repeat: repeat),
      ),
    );
  }
}
