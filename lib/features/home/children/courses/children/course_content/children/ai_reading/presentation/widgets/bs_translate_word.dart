import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/cubit/translation_cubit/translation_cubit.dart';
import 'package:client_app/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';

class BottomSheetTranslateBody extends StatefulWidget {
  final String word;
  final int readingId;

  const BottomSheetTranslateBody({
    super.key,
    required this.word,
    required this.readingId,
  });

  @override
  State<BottomSheetTranslateBody> createState() =>
      _BottomSheetTranslateBodyState();
}

class _BottomSheetTranslateBodyState extends State<BottomSheetTranslateBody> {
  late FlutterTts _flutterTts;

  @override
  void initState() {
    super.initState();
    _initializeTts();

    // Trigger translation when the bottom sheet opens
    context.read<TranslationCubit>().translateWord(
      widget.word,
      widget.readingId,
    );
  }

  @override
  void dispose() {
    _disposeTts();
    super.dispose();
  }

  Future<void> _initializeTts() async {
    _flutterTts = FlutterTts();
    try {
      await _flutterTts.setLanguage("en-US");
      await _flutterTts.setSpeechRate(0.25);
      await _flutterTts.setPitch(1.0);
    } catch (e) {
      debugPrint("TTS initialization error: $e");
    }
  }

  Future<void> _speakWord(BuildContext context, String word) async {
    try {
      await _flutterTts.setLanguage("en-US");
      await _flutterTts.setSpeechRate(0.25);
      await _flutterTts.setPitch(1.0);
      await _flutterTts.speak(word);
    } catch (e) {
      debugPrint("TTS speak error: $e");
      if (context.mounted) {
        ToastMessageUtil.showToast('Failed to play audio', context);
      }
    }
  }

  void _disposeTts() {
    _flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TranslationCubit, TranslationState>(
      listener: (context, state) {
        if (state is TranslationFailure) {
          ToastMessageUtil.showToast(state.message, context);
        }
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.only(
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

              if (state is TranslationLoading)
                const Center(child: CircularProgressIndicator())
              else if (state is TranslationSuccess)
                _buildTranslationSection(state.translation.translated)
              else
                const SizedBox(),
            ],
          ),
        );
      },
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
            widget.word,
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
          onPressed: () => _speakWord(context, widget.word),
        ),
      ],
    );
  }

  Widget _buildTranslationSection(String translation) {
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
            Text(
              translation,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        _buildAdditionalInfo(),
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

void showTranslateBottomSheet(
  BuildContext context,
  String word,
  int readingId,
) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) {
      return BlocProvider.value(
        value: serviceLocator<TranslationCubit>(),
        child: BottomSheetTranslateBody(word: word, readingId: readingId),
      );
    },
  );
}
