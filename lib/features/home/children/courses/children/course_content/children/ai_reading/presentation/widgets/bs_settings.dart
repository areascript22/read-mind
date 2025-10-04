// ---------------------------
// The showGeneralDialog + ReadingAIBS widget (Design adapted)
// ---------------------------

import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/widgets/playback_button.dart';
import 'package:flutter/material.dart';

Future<void> showReadingAIConfigBS(
  BuildContext context, {
  double initialFontSlider = 0.5,
  double initialRate = 1.0,
  double initialPitch = 1.0,
  required Future<void> Function(double fontSlider, double rate, double pitch)
  onApply,
}) {
  return showGeneralDialog(
    context: context,
    barrierLabel: "TopSheet",
    barrierDismissible: true,
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation1, animation2) {
      return ReadingAIBS(
        initialFontSlider: initialFontSlider,
        initialRate: initialRate,
        initialPitch: initialPitch,
        onApply: onApply,
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -1),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
  );
}

class ReadingAIBS extends StatefulWidget {
  final double initialFontSlider;
  final double initialRate;
  final double initialPitch;
  final Future<void> Function(double fontSlider, double rate, double pitch)
  onApply;

  const ReadingAIBS({
    super.key,
    required this.initialFontSlider,
    required this.initialRate,
    required this.initialPitch,
    required this.onApply,
  });

  @override
  State<ReadingAIBS> createState() => _ReadingAIBSState();
}

class _ReadingAIBSState extends State<ReadingAIBS> {
  final List<double> speeds = [0.5, 0.75, 1.0, 1.3];
  late double selectedSpeed;
  late double localFontSlider;
  late double localPitch;

  @override
  void initState() {
    super.initState();
    selectedSpeed = widget.initialRate;
    localFontSlider = widget.initialFontSlider;
    localPitch = widget.initialPitch;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Material(
          color: Colors.transparent,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.40,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top row: close + title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context); // close without saving
                      },
                      icon: const Icon(Icons.close),
                    ),
                    TextButton(
                      onPressed: () async {
                        // Save / apply
                        await widget.onApply(
                          localFontSlider,
                          selectedSpeed,
                          localPitch,
                        );
                        if (mounted) Navigator.pop(context);
                      },
                      child: const Text("Guardar"),
                    ),
                  ],
                ),

                const SizedBox(height: 8),
                const Text("Tamaño de letra", style: TextStyle(fontSize: 18)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.abc),
                    Expanded(
                      child: Slider(
                        onChanged:
                            (value) => setState(() => localFontSlider = value),
                        value: localFontSlider.clamp(0.0, 1.0),
                      ),
                    ),
                    Icon(
                      Icons.abc,
                      size: (12 + localFontSlider * (70 - 12)).toDouble(),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                const Text("Velocidad", style: TextStyle(fontSize: 18)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      speeds.map((speed) {
                        final bool isSelected = speed == selectedSpeed;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: PlayBackbutton(
                            isSelected: isSelected,
                            onTap: () => setState(() => selectedSpeed = speed),
                            speed: speed.toString(),
                          ),
                        );
                      }).toList(),
                ),

                const SizedBox(height: 12),
                // Optional pitch control (hidden minimal UI)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Pitch", style: TextStyle(fontSize: 14)),
                    SizedBox(
                      width: 160,
                      child: Slider(
                        min: 0.5,
                        max: 2.0,
                        value: localPitch,
                        onChanged: (v) => setState(() => localPitch = v),
                      ),
                    ),
                    Text(localPitch.toStringAsFixed(2)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
