import 'package:client_app/features/home/children/vocabulary/presentation/widget/dialog_show_translation_advice.dart';
import 'package:client_app/features/home/domain/entity/translation_entity.dart';
import 'package:client_app/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:intl/intl.dart';
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

  void _onRefresh() async {
    _loadTranslations();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vocabulario'),
        leading: IconButton(
          onPressed: () {
            showTranslationAdviceDialog(context);
          },
          icon: SvgPicture.asset(
            "assets/images/svg/question.svg",
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            width: 31,
            height: 31,
          ),
        ),
      ),
      body: BlocBuilder<VocabularyBloc, VocabularyState>(
        builder: (context, state) {
          return _buildBody(state);
        },
      ),
    );
  }

  Widget _buildBody(VocabularyState state) {
    return SmartRefresher(
      controller: _refreshController,
      enablePullDown: true,
      onRefresh: _onRefresh,
      child: _buildContent(state),
    );
  }

  Widget _buildContent(VocabularyState state) {
    if (state is VocabularyLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is VocabularyLoaded) {
      return _buildList(state.translations);
    } else if (state is VocabularyEmpty) {
      return _buildEmptyState();
    } else if (state is VocabularyError) {
      return _buildErrorState(state.message);
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildList(List translations) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: translations.length,
      itemBuilder: (context, index) {
        final translation = translations[index];
        return _buildTranslationTile(translation);
      },
    );
  }

  Widget _buildEmptyState() {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.translate_rounded, size: 110, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No hay traducciones todavía',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              'Desliza hacia abajo para actualizar',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              'Error: $message',
              style: const TextStyle(fontSize: 16, color: Colors.red),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Tire hacia abajo para volver a intentarlo',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTranslationTile(TranslationEntity t) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: cs.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "${t.sourceLang.toUpperCase()} → ${t.targetLang.toUpperCase()}",
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: cs.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  "#${t.id}",
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: cs.onSurfaceVariant.withOpacity(0.5),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Text(
              "Original",
              style: theme.textTheme.labelMedium?.copyWith(
                color: cs.onSurfaceVariant,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: cs.surfaceVariant.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      t.sourceText,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: cs.onSurface,
                        height: 1.35,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),

                InkWell(
                  onTap: () => _speak(t.sourceText),
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: cs.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.volume_up, size: 20, color: cs.onPrimary),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            Text(
              "Traducción",
              style: theme.textTheme.labelMedium?.copyWith(
                color: cs.onSurfaceVariant,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: cs.primary.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: cs.primary.withValues(alpha: 0.1)),
              ),
              child: Text(
                t.translated,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: cs.onSurface,
                  height: 1.35,
                ),
              ),
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Icon(
                  Icons.repeat_rounded,
                  size: 18,
                  color: cs.primary.withValues(alpha: 0.8),
                ),
                const SizedBox(width: 6),
                Text(
                  "${t.timesUsed} usos",
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: cs.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Text(
                  DateFormat("dd/MM/yy").format(t.createdAt),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: cs.onSurfaceVariant.withValues(alpha: 0.5),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
