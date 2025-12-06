import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  TtsService._privateConstructor();

  static final TtsService _instance = TtsService._privateConstructor();

  static TtsService get instance => _instance;

  final FlutterTts flutterTts = FlutterTts();

  Future<void> init() async {
    await flutterTts.setLanguage("es-ES");
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1.0);
  }

  Future<void> speak(String text) async {
    await flutterTts.stop();
    await flutterTts.speak(text);
  }

  Future<void> stop() async {
    await flutterTts.stop();
  }
}
