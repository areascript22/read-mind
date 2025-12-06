import 'dart:ui';
import 'package:flutter/cupertino.dart';
import '../../../../../../../../../../../core/common/widget/lottie_loader.dart';

class BlurLoader extends StatelessWidget {
  const BlurLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: const Center(child: LottieLoader(size: 200)),
      ),
    );
  }
}
