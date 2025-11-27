import 'package:client_app/core/routing/route_names.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/widgets/bs_translate_word.dart';
import 'package:client_app/features/home/children/courses/children/course_content/data/models/activity_model/activity_model.dart';
import 'package:client_app/features/home/children/courses/children/course_content/presentation/bloc/activity_progress/activity_progress_bloc.dart';
import 'package:client_app/shared/widgets/loader_indicator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:go_router/go_router.dart';
import '../widgets/bs_settings.dart';

class AiReadingActivity extends StatefulWidget {
  final ActivityModel activityModel;

  const AiReadingActivity({super.key, required this.activityModel});

  @override
  State<AiReadingActivity> createState() => _AiReadingActivityState();
}

class _AiReadingActivityState extends State<AiReadingActivity> {
  String paragraph = "";
  List<String> sentences = [];
  List<int> sentenceStartIndices = [];

  late final FlutterTts _flutterTts;
  bool isPlaying = false;
  bool isSeeking = false;
  int _tempCurrentCharIndex = -1;
  int currentCharIndex = 0;
  int currentSentenceIndex = -1;

  double minFontSize = 12;
  double maxFontSize = 30;
  double fontSliderValue = 0.5;

  double get fontSize =>
      minFontSize + (fontSliderValue * (maxFontSize - minFontSize));

  double ttsRate = 0.5; // default mapping to speeds array (0.5..1.3)
  double ttsPitch = 1.0;

  String? selectedWord;
  Offset? tapPosition;

  @override
  void initState() {
    super.initState();

    paragraph =
        (widget.activityModel.maybeMap(
                  aIReading: (m) => m.content,
                  orElse: () => null,
                ) ??
                "")
            .trim();
    _flutterTts = FlutterTts();
    _prepareSentences();
    initializeTts();
  }

  @override
  void dispose() {
    _teardownTts();
    super.dispose();
  }

  void _storeTapPosition(TapDownDetails details) {
    tapPosition = details.globalPosition;
  }

  Future<void> initializeTts() async {
    try {
      await _flutterTts.setLanguage("en-US");
      await _flutterTts.setPitch(ttsPitch);
      await _flutterTts.setSpeechRate(ttsRate);

      _flutterTts.setProgressHandler((
        String text,
        int start,
        int end,
        String word,
      ) {
        if (mounted && !isSeeking) {
          final base =
              (_tempCurrentCharIndex != -1) ? _tempCurrentCharIndex : 0;
          final newIndex = base + start;
          currentCharIndex = newIndex.clamp(0, paragraph.length);
          updateCurrentSentenceIndex(currentCharIndex);
          setState(() {});
        }
      });

      _flutterTts.setCompletionHandler(() {
        if (!mounted) return;
        currentSentenceIndex = -1;
        currentCharIndex = 0;
        isPlaying = false;
        _tempCurrentCharIndex = -1;
        setState(() {});

        final readingId = widget.activityModel.maybeMap(
          aIReading: (m) => m.aiReadingId,
          orElse: () => null,
        );

        if (readingId != null) {
          context.read<ActivityProgressBloc>().add(
            UpdateProgressEvent(
              aiReadingId: readingId,
              dataToUpdate: {"readingCompleted": true},
            ),
          );
        }
      });

      _flutterTts.setStartHandler(() {});
    } catch (e) {
      debugPrint("TTS init error: $e");
    }
  }

  Future<void> _teardownTts() async {
    try {
      await _flutterTts.stop();
      try {
        _flutterTts.setProgressHandler((_, __, ___, ____) {});
        _flutterTts.setCompletionHandler(() {});
        _flutterTts.setStartHandler(() {});
      } catch (_) {}
    } catch (_) {}
  }

  void _prepareSentences() {
    sentences = _splitIntoSentences(paragraph);
    sentenceStartIndices = _computeSentenceStartIndices(paragraph, sentences);
  }

  List<String> _splitIntoSentences(String text) {
    if (text.trim().isEmpty) return [];
    final regex = RegExp(r'([^,.;:!?]+[\,\.;:!\?]?)\s*', multiLine: true);
    final matches = regex.allMatches(text);
    final list =
        matches
            .map((m) => m.group(1)!.trim())
            .where((s) => s.isNotEmpty)
            .toList();
    if (list.isEmpty) return [text.trim()];
    return list;
  }

  List<int> _computeSentenceStartIndices(String text, List<String> sents) {
    List<int> indices = [];
    int searchStart = 0;
    for (var s in sents) {
      final idx = text.indexOf(s, searchStart);
      if (idx >= 0) {
        indices.add(idx);
        searchStart = idx + s.length;
      } else {
        indices.add(searchStart);
        searchStart += s.length;
      }
    }
    return indices;
  }

  void updateCurrentSentenceIndex(int globalIndex) {
    if (sentences.isEmpty || sentenceStartIndices.isEmpty) {
      if (currentSentenceIndex != -1) {
        currentSentenceIndex = -1;
        setState(() {});
      }
      return;
    }

    for (int i = 0; i < sentenceStartIndices.length; i++) {
      final start = sentenceStartIndices[i];
      final end =
          (i + 1 < sentenceStartIndices.length)
              ? sentenceStartIndices[i + 1]
              : paragraph.length;
      if (globalIndex >= start && globalIndex < end) {
        if (currentSentenceIndex != i) {
          currentSentenceIndex = i;
          setState(() {});
        }
        return;
      }
    }

    if (currentSentenceIndex != -1) {
      currentSentenceIndex = -1;
      setState(() {});
    }
  }

  void togglePlayPause() async {
    if (isPlaying) {
      try {
        await _flutterTts.pause();
      } catch (_) {
        try {
          await _flutterTts.stop();
        } catch (_) {}
      }
      isPlaying = false;
      setState(() {});
      return;
    }

    if (currentCharIndex < 0 || currentCharIndex >= paragraph.length) {
      currentCharIndex = 0;
      currentSentenceIndex = 0;
    }

    await speakFrom(currentCharIndex);
    isPlaying = true;
    setState(() {});
  }

  Future<void> speakFrom(int index) async {
    if (paragraph.isEmpty) return;
    index = index.clamp(0, paragraph.length);
    _tempCurrentCharIndex = index;
    try {
      await _flutterTts.stop();
    } catch (_) {}
    final sub = paragraph.substring(index);
    try {
      await _flutterTts.speak(sub);
    } catch (e) {
      debugPrint("TTS speak error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocBuilder<ActivityProgressBloc, ActivityProgressState>(
            builder: (context, state) {
              if (state is ProgressLoading) {
                return LoaderIndicator(
                  spinnerSize: 20,
                  spinnerColor: Colors.white,
                );
              }
              if (state is ProgressCreated &&
                  state.createdProgress.subactivitiesCompleted.reading) {
                return Icon(Icons.check);
              }

              if (state is ProgressUpdated &&
                  state.updatedProgress.subactivitiesCompleted.reading) {
                return Icon(Icons.check);
              }

              return SizedBox.shrink();
            },
          ),
          IconButton(
            onPressed: _openSettings,
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: _buildRichText(),
            ),
          ),
          _buildPlayerControls(),
          _buildNextButton(),
        ],
      ),
    );
  }

  Widget _buildNextButton() {
    return BlocConsumer<ActivityProgressBloc, ActivityProgressState>(
      builder: (context, state) {
        if (state is ProgressLoading) {
          return LoaderIndicator();
        }
        if (state is ProgressCreated &&
            state.createdProgress.subactivitiesCompleted.reading) {
          return _buildButton(context);
        }

        if (state is ProgressUpdated &&
            state.updatedProgress.subactivitiesCompleted.reading) {
          return _buildButton(context);
        }

        return SizedBox.shrink();
      },
      listener: (context, state) {},
    );
  }

  ElevatedButton _buildButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        context.push(
          RouteNames.activityParaphrase,
          extra: widget.activityModel.toAIReadingEntity(),
        );
      },
      icon: const Icon(Icons.arrow_forward),
      label: const Text('Continuar'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        minimumSize: const Size(double.infinity, 45),
      ),
    );
  }

  Widget _buildPlayerControls() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildProgressBar(),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: togglePlayPause,
                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                label: Text(isPlaying ? 'Pause' : 'Play'),
              ),
              const SizedBox(width: 12),
              ElevatedButton.icon(
                onPressed: () async {
                  try {
                    await _flutterTts.stop();
                  } catch (_) {}
                  isPlaying = false;
                  currentCharIndex = 0;
                  currentSentenceIndex = -1;
                  _tempCurrentCharIndex = -1;
                  setState(() {});
                },
                icon: const Icon(Icons.stop),
                label: const Text('Stop'),
              ),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    final max = paragraph.isNotEmpty ? paragraph.length.toDouble() : 0.0;
    final value = currentCharIndex.toDouble().clamp(0.0, max);
    final percentage =
        (paragraph.isEmpty || max == 0)
            ? 0.0
            : ((currentCharIndex / max) * 100).clamp(0.0, 100.0);

    return Column(
      children: [
        Slider(
          activeColor: Colors.amber,
          min: 0,
          max: max,
          value: value,
          onChanged: (v) {
            isSeeking = true;
            currentCharIndex = v.toInt();
            updateCurrentSentenceIndex(currentCharIndex);
            setState(() {});
          },
          onChangeEnd: (v) async {
            isSeeking = false;
            currentCharIndex = v.toInt();
            updateCurrentSentenceIndex(currentCharIndex);
            await speakFrom(currentCharIndex);
            isPlaying = true;
            setState(() {});
          },
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            "${percentage.toStringAsFixed(1)}% read",
            style: const TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }

  Widget _buildRichText() {
    if (paragraph.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text("No content available", style: TextStyle(fontSize: 16)),
      );
    }

    final words = paragraph.split(' ');
    final List<TextSpan> spans = [];

    int currentIndex = 0;

    for (final word in words) {
      final wordStart = paragraph.indexOf(word, currentIndex);
      final wordEnd = wordStart + word.length;
      currentIndex = wordEnd;

      final isRead = wordEnd <= currentCharIndex;
      final inCurrentSentence =
          (currentSentenceIndex >= 0 &&
              wordStart >= sentenceStartIndices[currentSentenceIndex] &&
              wordStart <
                  (currentSentenceIndex + 1 < sentenceStartIndices.length
                      ? sentenceStartIndices[currentSentenceIndex + 1]
                      : paragraph.length));

      Color color;
      if (isRead) {
        color = Colors.orange;
      } else if (inCurrentSentence) {
        color = Colors.blue;
      } else {
        color = Colors.black;
      }

      // Apply visual highlight if user tapped the word
      final isSelected = word == selectedWord;

      spans.add(
        TextSpan(
          text: '$word ',
          style: TextStyle(
            fontSize: fontSize,
            color: isSelected ? Colors.blueAccent : color,
            backgroundColor:
                isSelected ? Colors.blue.withValues(alpha: 0.2) : null,
          ),
          recognizer:
              TapGestureRecognizer()
                ..onTapDown = _storeTapPosition
                ..onTap = () {
                  setState(() {
                    selectedWord = word;
                  });
                  _showTranslateOption(context, word);
                },
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: RichText(
        text: TextSpan(style: const TextStyle(height: 1.8), children: spans),
      ),
    );
  }

  void _showTranslateOption(BuildContext context, String word) async {
    final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final position = tapPosition ?? Offset.zero;

    final selected = await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy,
        overlay.size.width - position.dx,
        overlay.size.height - position.dy,
      ),
      items: [
        const PopupMenuItem(value: 'translate', child: Text('Translate')),
        const PopupMenuItem(value: 'save', child: Text('save')),
      ],
    );
    if (selected == "translate") {
      final readingId = widget.activityModel.maybeMap(
        aIReading: (m) => m.aiReadingId,
        orElse: () => null,
      );

      if (context.mounted && readingId != null) {
        showTranslateBottomSheet(context, word, readingId);
      }
    }
  }

  Future<void> _openSettings() async {
    await showReadingAIConfigBS(
      context,
      initialFontSlider: fontSliderValue,
      initialRate: ttsRate,
      initialPitch: ttsPitch,
      onApply: (double newFontSlider, double newRate, double newPitch) async {
        setState(() {
          fontSliderValue = newFontSlider;
          ttsRate = newRate;
          ttsPitch = newPitch;
        });

        try {
          await _flutterTts.setSpeechRate(ttsRate);
        } catch (_) {}
        try {
          await _flutterTts.setPitch(ttsPitch);
        } catch (_) {}
        _prepareSentences(); // re-compute indices (not strictly necessary, but safe)
      },
    );
  }
}
