import 'package:client_app/features/home/children/courses/children/course_content/children/flash_cards/presentation/widget/flash_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import '../../../../../../../../domain/entity/translation_entity.dart';

class FlashCardsActivityPage extends StatefulWidget {
  final List<TranslationEntity> translations;

  const FlashCardsActivityPage({super.key, required this.translations});

  @override
  State<FlashCardsActivityPage> createState() => _FlashCardsActivityPageState();
}

class _FlashCardsActivityPageState extends State<FlashCardsActivityPage> {
  final CardSwiperController _cardSwiperController = CardSwiperController();
  final TextEditingController _translationController = TextEditingController();
  final Map<int, bool> _answeredCards = {};
  final Map<int, String> _userAnswers = {};
  int _currentIndex = 0;
  bool isCardSwiperDisabled = true;

  @override
  void dispose() {
    _cardSwiperController.dispose();
    _translationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.close_rounded, size: 28, color: Colors.white),
              splashRadius: 20,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProgressIndicator(),
            const SizedBox(height: 32),
            Expanded(child: _buildCardSwiper()),
            const SizedBox(height: 24),
            _buildTranslationInput(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    final completedCount = _answeredCards.length;
    final totalCount = widget.translations.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'FlashCards',
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: LinearProgressIndicator(
                value: totalCount > 0 ? completedCount / totalCount : 0,
                backgroundColor:
                    Theme.of(context).colorScheme.surfaceContainerHighest,
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              '$completedCount/$totalCount',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onBackground.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCardSwiper() {
    return CardSwiper(
      controller: _cardSwiperController,
      cardsCount: widget.translations.length,
      onSwipe: _handleSwipe,
      onUndo: _handleUndo,
      numberOfCardsDisplayed: 3,
      padding: const EdgeInsets.all(0),
      isLoop: false,
      isDisabled: isCardSwiperDisabled,
      onEnd: () {},

      cardBuilder: (context, index, horizontalThreshold, verticalThreshold) {
        final translation = widget.translations[index];
        final isAnswered = _answeredCards.keys.contains(index);
        final answer = _userAnswers[_currentIndex] ?? 'No answer';
        final isCorrect =
            isAnswered &&
            answer.toLowerCase().trim() ==
                translation.translated.toLowerCase().trim();

        return FlashCard(
          translation: translation,
          isAnswered: isAnswered,
          userAnswer: answer,
          isCorrect: isCorrect,
        );
      },
    );
  }

  Widget _buildTranslationInput() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final currentTranslation =
        _currentIndex < widget.translations.length
            ? widget.translations[_currentIndex]
            : null;
    final isAnswered =
        currentTranslation != null && _answeredCards.containsKey(_currentIndex);

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: colorScheme.outline.withValues(alpha: 0.2),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: colorScheme.shadow.withValues(alpha: 0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: _translationController,
              enabled: !isAnswered,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Escribe la traducción al español...',
                hintStyle: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.4),
                ),
                suffixIcon:
                    isAnswered
                        ? Icon(
                          _userAnswers[_currentIndex]?.toLowerCase().trim() ==
                                  currentTranslation?.translated
                                      .toLowerCase()
                                      .trim()
                              ? Icons.check_circle_rounded
                              : Icons.error_rounded,
                          color:
                              _userAnswers[_currentIndex]
                                          ?.toLowerCase()
                                          .trim() ==
                                      currentTranslation?.translated
                                          .toLowerCase()
                                          .trim()
                                  ? Colors.green
                                  : Colors.red,
                        )
                        : null,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: isAnswered ? _nextCard : _checkAnswer,
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  isAnswered ? colorScheme.primary : colorScheme.secondary,
              foregroundColor: colorScheme.onPrimary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 2,
            ),
            child: Text(
              isAnswered ? 'Siguiente Tarjeta' : 'Comprobar Respuesta',
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _checkAnswer() {
    if (_translationController.text.trim().isEmpty) return;

    final currentTranslation = widget.translations[_currentIndex];
    final userAnswer = _translationController.text.trim();
    final isCorrect =
        userAnswer.toLowerCase() == currentTranslation.translated.toLowerCase();

    setState(() {
      _answeredCards[_currentIndex] = isCorrect;
      _userAnswers[_currentIndex] = userAnswer;
      isCardSwiperDisabled = false;
    });
  }

  void _nextCard() {
    _translationController.clear();
    _cardSwiperController.swipe(CardSwiperDirection.right);
    setState(() {});
  }

  bool _handleSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    setState(() {
      _translationController.clear();
      _currentIndex = currentIndex ?? 0;
      isCardSwiperDisabled = true;
    });
    return true;
  }

  bool _handleUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    setState(() {
      _currentIndex = currentIndex;
    });
    return true;
  }
}
