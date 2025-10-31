import 'package:client_app/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../bloc/vocabulary_bloc/vocabulary_bloc.dart';

class VocabularyPage extends StatefulWidget {
  const VocabularyPage({super.key});

  @override
  State<VocabularyPage> createState() => _VocabularyPageState();
}

class _VocabularyPageState extends State<VocabularyPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: serviceLocator<VocabularyBloc>(),
      child: VocabularyPageBody(),
    );
  }
}

class VocabularyPageBody extends StatefulWidget {
  const VocabularyPageBody({super.key});

  @override
  State<VocabularyPageBody> createState() => _VocabularyPageBodyState();
}

class _VocabularyPageBodyState extends State<VocabularyPageBody> {
  late FlutterTts _flutterTts;
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    _initializeTts();
    _loadTranslations();
  }

  @override
  void dispose() {
    _disposeTts();
    _refreshController.dispose();
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

  void _disposeTts() {
    _flutterTts.stop();
  }

  void _loadTranslations() {
    context.read<VocabularyBloc>().add(LoadAllTranslations());
  }

  Future<void> _speak(String text) async {
    try {
      await _flutterTts.speak(text);
    } catch (e) {
      debugPrint("TTS speak error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vocabulary')),
      body: BlocBuilder<VocabularyBloc, VocabularyState>(
        builder: (context, state) {
          return _buildBody(state);
        },
      ),
    );
  }

  Widget _buildBody(VocabularyState state) {
    if (state is VocabularyLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is VocabularyLoaded) {
      return _buildList(state.translations);
    } else if (state is VocabularyEmpty) {
      return const Center(child: Text('No translations yet'));
    } else if (state is VocabularyError) {
      return Center(child: Text('Error: ${state.message}'));
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildList(List translations) {
    return SmartRefresher(
      controller: _refreshController,
      enablePullDown: true,
      onRefresh: () async {
        _loadTranslations();
        _refreshController.refreshCompleted();
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: translations.length,
        itemBuilder: (context, index) {
          final translation = translations[index];
          return _buildTranslationTile(translation);
        },
      ),
    );
  }

  Widget _buildTranslationTile(dynamic translation) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    translation.sourceText,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    translation.translated,
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Used: ${translation.timesUsed} times',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () => _speak(translation.sourceText),
              icon: const Icon(Icons.volume_up),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
