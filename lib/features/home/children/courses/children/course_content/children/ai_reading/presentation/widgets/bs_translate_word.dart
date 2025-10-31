import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class BottomSheetTranslateBody extends StatelessWidget {
  final String word;
  final VoidCallback onListenPressed;

  const BottomSheetTranslateBody({
    super.key,
    required this.word,
    required this.onListenPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: 24),
          _buildOriginalWord(),
          const SizedBox(height: 16),

          const Divider(height: 1, color: Colors.grey),
          const SizedBox(height: 24),

          // Translation Section
          _buildTranslationSection(),
          const SizedBox(height: 8),

          // Additional Info
          _buildAdditionalInfo(),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Translation',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        IconButton(
          icon: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.close, size: 20),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }

  Widget _buildOriginalWord() {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text(
              'EN',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            word,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ),
        IconButton(
          icon: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(Icons.volume_up, color: Colors.white, size: 20),
          ),
          onPressed: onListenPressed,
        ),
      ],
    );
  }

  Widget _buildTranslationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  'ES',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'Spanish',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAdditionalInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Text(
          'Guardado en el vocabulario',
          style: TextStyle(
            fontSize: 14,
            color: Colors.green,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green[400], size: 16),
            const SizedBox(width: 4),
            const Text(
              'Esta palabra se ha añadido a tu lista de aprendizaje.',
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ],
        ),
      ],
    );
  }
}

void showTranslateBottomSheet(BuildContext context, String word) {
  final FlutterTts bottomSheetTts = FlutterTts();
  Future<void> initializeBottomSheetTts() async {
    try {
      await bottomSheetTts.setLanguage("en-US");
      await bottomSheetTts.setSpeechRate(0.25);
      await bottomSheetTts.setPitch(1.0);
    } catch (e) {
      debugPrint("Bottom sheet TTS init error: $e");
    }
  }

  Future<void> speakWord() async {
    try {
      await bottomSheetTts.speak(word);
    } catch (e) {
      debugPrint("Bottom sheet TTS speak error: $e");
      if (context.mounted) {
        ToastMessageUtil.showToast('Failed to play audio', context);
      }
    }
  }

  initializeBottomSheetTts();

  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) {
      return BottomSheetTranslateBody(word: word, onListenPressed: speakWord);
    },
  ).whenComplete(() {
    bottomSheetTts.stop();
  });
}
