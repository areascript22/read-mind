import 'dart:async';
import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:client_app/core/common/widget/custom_button.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/flash_cards/presentation/cubit/flashcard_bloc/flash_card_bloc.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/flash_cards/presentation/widget/dialog_close_activity.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/flash_cards/presentation/widget/dialog_flashcards_result.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/flash_cards/presentation/widget/flash_card.dart';
import 'package:client_app/shared/widgets/loader_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import '../../domain/entity/param_flashcard_entity.dart';

class FlashCardsActivityPage extends StatefulWidget {
  final ParamFlashCardEntity data;

  const FlashCardsActivityPage({super.key, required this.data});

  @override
  State<FlashCardsActivityPage> createState() => _FlashCardsActivityPageState();
}

class _FlashCardsActivityPageState extends State<FlashCardsActivityPage> {
  final CardSwiperController _cardSwiperController = CardSwiperController();
  final TextEditingController _translationController = TextEditingController();
  final Map<int, bool> _answeredCards = {};
  final Map<int, String> _userAnswers = {};
  final Map<int, int> _cardTimers = {};
  int _currentIndex = 0;
  bool isCardSwiperDisabled = true;

  Timer? _currentTimer;
  int _currentCardSeconds = 0;
  bool _isTimerRunning = false;
  bool _completeSessionByClosingPage = false;

  @override
  void initState() {
    super.initState();
    _startTimerForCurrentCard();
  }

  @override
  void dispose() {
    _currentTimer?.cancel();
    _cardSwiperController.dispose();
    _translationController.dispose();
    super.dispose();
  }

  void _startTimerForCurrentCard() {
    _currentTimer?.cancel();

    _currentCardSeconds = 0;
    _isTimerRunning = true;

    _currentTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_isTimerRunning) {
        setState(() {
          _currentCardSeconds++;
        });
      }
    });
  }

  // NUEVO MÉTODO: Reiniciar contador para nueva card
  void _resetTimerForNextCard() {
    _currentTimer?.cancel();
    _currentCardSeconds = 0;
    _isTimerRunning = true;

    _currentTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_isTimerRunning) {
        setState(() {
          _currentCardSeconds++;
        });
      }
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: IconButton(
                onPressed: () async {
                  _completeSessionByClosingPage = true;
                  final currentSessionId =
                      context
                          .read<FlashCardBloc>()
                          .state
                          .currentFlashcardSession
                          .id;
                  final result = await showExitFlashCardDialog(
                    context: context,
                    sessionId: currentSessionId,
                  );
                  if (result == null || result == false) {
                    _completeSessionByClosingPage = false;
                    return;
                  }
                  if (result == true && context.mounted) {
                    Navigator.pop(context);
                  }
                },
                icon: Icon(Icons.close_rounded, size: 28, color: Colors.white),
                splashRadius: 20,
              ),
            ),
          ],
          leading: BlocConsumer<FlashCardBloc, FlashCardState>(
            builder: (context, state) {
              if (state.isCompletingSession) {
                return LoaderIndicator(spinnerColor: Colors.blueAccent);
              }
              return SizedBox();
            },
            listener: (context, state) async {
              print("Testing purposes");
              if (state.flashCardAction == FlashCardAction.completeSession &&
                  state.isSessionCompleted &&
                  !_completeSessionByClosingPage) {
                await _finishSession(context);
                print("Finish session");
              }
              if (state.flashCardAction == FlashCardAction.reInitSession &&
                  state.isInitialSessionCreated) {
                print("Initial sesion created again");
                _restartCardSwiper();
              }
            },
          ),
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
      ),
    );
  }

  Future<void> _finishSession(BuildContext context) async {
    final session = context.read<FlashCardBloc>().state.currentFlashcardSession;
    final result = await showFlashCardResultsDialog(
      context: context,
      session: session,
    );
    if (context.mounted) {
      if (result) {
        Navigator.pop(context);
      } else {
        context.read<FlashCardBloc>().add(
          FlashCardReCreateInitialSession(activityId: widget.data.activityId),
        );
      }
    }
  }

  void _restartCardSwiper() {
    _cardSwiperController.moveTo(0);
    // 1. Parar timer
    _currentTimer?.cancel();

    // 2. Resetear estado
    setState(() {
      _answeredCards.clear();
      _userAnswers.clear();
      _cardTimers.clear();
      _currentIndex = 0;
      _currentCardSeconds = 0;
      isCardSwiperDisabled = true;
      _translationController.clear();
    });

    // 3. Reiniciar timer
    _startTimerForCurrentCard();

    // 4. Forzar rebuild del CardSwiper
    // El CardSwiper se reconstruirá automáticamente con el nuevo estado
  }

  Widget _buildProgressIndicator() {
    final completedCount = _answeredCards.length;
    final totalCount = widget.data.translations.length;
    final currentTime = _currentCardSeconds;
    final isAnswered = _answeredCards.containsKey(_currentIndex);

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$completedCount/$totalCount',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onBackground.withOpacity(0.7),
                  ),
                ),

                if (!isAnswered)
                  Text(
                    '$currentTime seg',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onBackground.withOpacity(0.5),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCardSwiper() {
    return CardSwiper(
      controller: _cardSwiperController,
      cardsCount: widget.data.translations.length,
      onSwipe: _handleSwipe,
      numberOfCardsDisplayed: 3,
      padding: const EdgeInsets.all(0),
      isLoop: false,
      isDisabled: isCardSwiperDisabled,
      onEnd: _handleSessionEnd,
      cardBuilder: (context, index, horizontalThreshold, verticalThreshold) {
        final translation = widget.data.translations[index];
        final isAnswered = _answeredCards.keys.contains(index);
        final answer = _userAnswers[index] ?? 'No answer';
        final isCorrect =
            isAnswered &&
            answer.toLowerCase().trim() ==
                translation.translated.toLowerCase().trim();
        final cardTime = _cardTimers[index] ?? 0;

        return FlashCard(
          translation: translation,
          isAnswered: isAnswered,
          userAnswer: answer,
          isCorrect: isCorrect,
          timeSpent: isAnswered ? cardTime : null,
        );
      },
    );
  }

  void _handleSessionEnd() async {
    _currentTimer?.cancel();
    _isTimerRunning = false;

    final session = context.read<FlashCardBloc>().state.currentFlashcardSession;
    context.read<FlashCardBloc>().add(
      FlashCardCompleteSession(sessionId: session.id),
    );
  }

  Widget _buildTranslationInput() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final currentTranslation =
        _currentIndex < widget.data.translations.length
            ? widget.data.translations[_currentIndex]
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
                  color: colorScheme.onSurface.withOpacity(0.4),
                ),
                suffixIcon:
                    isAnswered
                        ? Icon(
                          _userAnswers[_currentIndex]?.toLowerCase().trim() ==
                                  currentTranslation.translated
                                      .toLowerCase()
                                      .trim()
                              ? Icons.check_circle_rounded
                              : Icons.error_rounded,
                          color:
                              _userAnswers[_currentIndex]
                                          ?.toLowerCase()
                                          .trim() ==
                                      currentTranslation.translated
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
        BlocConsumer<FlashCardBloc, FlashCardState>(
          builder: (context, state) {
            final isLoading = state.isSavingCardAttempt;
            return CustomButton(
              onTap:
                  isLoading
                      ? () {}
                      : isAnswered
                      ? _nextCard
                      : _checkAnswer,
              child:
                  isLoading
                      ? LoaderIndicator(spinnerColor: Colors.blueAccent)
                      : Text(
                        isAnswered
                            ? 'Siguiente Tarjeta'
                            : 'Comprobar Respuesta',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
            );
          },
          listener: (context, state) {},
        ),
      ],
    );
  }

  void _checkAnswer() {
    if (_translationController.text.trim().isEmpty) {
      ToastMessageUtil.showToast("Escribe tu respuesta...", context);
      return;
    }

    final currentTranslation = widget.data.translations[_currentIndex];
    final userAnswer = _translationController.text.trim();
    final isCorrect =
        userAnswer.toLowerCase() == currentTranslation.translated.toLowerCase();

    setState(() {
      _answeredCards[_currentIndex] = isCorrect;
      _userAnswers[_currentIndex] = userAnswer;
      isCardSwiperDisabled = false;
    });

    _isTimerRunning = false;
    _currentTimer?.cancel();
    _cardTimers[_currentIndex] = _currentCardSeconds;

    final sessionId =
        context.read<FlashCardBloc>().state.currentFlashcardSession.id;
    if (sessionId != 0) {
      context.read<FlashCardBloc>().add(
        FlashCardCreateAttempt(
          sessionId: sessionId,
          userTranslationId: currentTranslation.id,
          userAnswer: userAnswer,
          timeSpentSec: _currentCardSeconds,
          isCorrect: isCorrect,
        ),
      );
    }
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
    _resetTimerForNextCard();
    setState(() {
      _translationController.clear();
      _currentIndex = currentIndex ?? 0;
      isCardSwiperDisabled = true;
    });
    return true;
  }
}
