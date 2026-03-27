import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/cubit/timer_cubit_attempt/timer_attempt_cubit.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/widgets/buttons/reading_activity_button.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/widgets/dialog/dialog_feedback.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/widgets/original_paragraph_card.dart';
import 'package:client_app/features/home/children/courses/children/student_tracking/data/model/progress/progress_model.dart';
import 'package:client_app/shared/widgets/loader_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/entities/ai_reading_entity.dart';
import '../../../../presentation/bloc/activity_progress/activity_progress_bloc.dart';
import '../bloc/ai_reading_bloc/ai_reading_bloc.dart';
import '../cubit/attempts_cubit/attempts_cubit.dart';
import '../widgets/blus/blur_loader.dart';
import '../widgets/dialog/dialog_paraphrase_attempts.dart';
import '../widgets/dialog/dialog_paraphrase_tip.dart';

class ParaphrasePage extends StatefulWidget {
  final AIReadingEntity aiReadingEntity;

  const ParaphrasePage({super.key, required this.aiReadingEntity});

  @override
  State<ParaphrasePage> createState() => _ParaphrasePageState();
}

class _ParaphrasePageState extends State<ParaphrasePage> {
  final TextEditingController _controller = TextEditingController();
  bool _isExpanded = false;
  late TimerAttemptCubit timerAttemptCubit;

  @override
  void initState() {
    super.initState();
    _initValues();
  }

  void _initValues() {
    timerAttemptCubit = context.read<TimerAttemptCubit>();
    //timerAttemptCubit.setStartTime(DateTime.now());
  }

  void _submitParaphrase(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (_controller.text.trim().isEmpty) {
      ToastMessageUtil.showToast("Escribe algo para continuar", context);
      return;
    }
    timerAttemptCubit.setCompleteTime(DateTime.now());
    context.read<AiReadingBloc>().add(
      EvaluateParaphraseEvent(
        paragraph: widget.aiReadingEntity.content,
        paraphrase: _controller.text,
        activityId: widget.aiReadingEntity.id,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocConsumer<AiReadingBloc, AiReadingState>(
      listener: (context, state) {
        if (state is AiReadingError &&
            state.actionType == AiActionType.paraphrase) {
          ToastMessageUtil.showToast(state.message, context);
        }
        if (state is AiReadingSuccess &&
            state.actionType == AiActionType.paraphrase) {
          showFeedbackDialog(context, state.feedbackEntity);

          final totalSeconds = timerAttemptCubit.totalTimeSec;
          context.read<AttemptsCubit>().createParaphraseAttempt(
            aiReadingId: widget.aiReadingEntity.aiReadingId,
            similarityScore: state.feedbackEntity.similarityScore,
            fluencyScore: state.feedbackEntity.fluencyScore,
            originalityScore: state.feedbackEntity.originalityScore,
            feedback: state.feedbackEntity.feedback,
            timeSpentSec: totalSeconds,
          );
        }
      },
      builder: (context, state) {
        final isLoading =
            state is AiReadingLoading &&
            state.actionType == AiActionType.paraphrase;

        return PopScope(
          canPop: true,
          child: Scaffold(
            body: Stack(
              children: [
                SafeArea(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: IntrinsicHeight(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildHeader(),

                                OriginalParagraphCard(
                                  content: widget.aiReadingEntity.content,
                                  isExpanded: _isExpanded,
                                  onToggle: () {
                                    setState(() => _isExpanded = !_isExpanded);
                                  },
                                ),

                                const SizedBox(height: 10),

                                Text(
                                  "Ahora escribe el párrafo con tus propias palabras:",
                                  style: theme.textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                _buildRichTextField(),
                                const SizedBox(height: 20),

                                ReadingActivityButton(
                                  label: "Evaluar paráfrasis",
                                  onPressed: () => _submitParaphrase(context),
                                  isLoading: isLoading,
                                ),

                                SizedBox(height: 15),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                if (isLoading) BlurLoader(),
              ],
            ),
            floatingActionButton: _buildFloatingActionButton(context),
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Actividad de paráfrasis",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            BlocConsumer<AttemptsCubit, AttemptsState>(
              builder: (context, state) {
                if (state is AttemptsLoading && state.attemptOperation ==
                    AttemptOperation
                        .paraphrase) {
                  return LoaderIndicator(
                    spinnerSize: 20,
                    spinnerColor: Colors.red,
                  );
                }
                if (state is AttemptParaphraseCreated) {
                  return IconButton(
                    onPressed: () {
                      showParaphraseAttemptsDialog(
                        context,
                        widget.aiReadingEntity,
                      );
                    },
                    icon: Icon(Icons.book),
                  );
                }
                return IconButton(
                  onPressed: () {
                    showParaphraseAttemptsDialog(
                      context,
                      widget.aiReadingEntity,
                    );
                  },
                  icon: Icon(Icons.book),
                );
              },
              listener: (context, state) {
                if (state is AttemptsError && state.attemptOperation ==
                    AttemptOperation
                        .paraphrase) {
                  timerAttemptCubit.setStartTime(
                    DateTime.now(),
                  );
                  ToastMessageUtil.showToast(
                    state.message,
                    context,
                  );
                }

                if (state is AttemptParaphraseCreated) {
                  timerAttemptCubit.setStartTime(
                    DateTime.now(),
                  );
                  context
                      .read<ActivityProgressBloc>()
                      .add(
                    UpdateProgressEvent(
                      aiReadingId:
                      widget
                          .aiReadingEntity
                          .aiReadingId,
                      dataToUpdate: {
                        "paraphraseCompleted":
                        true,
                      },
                    ),
                  );
                }
              },
            ),
            BlocBuilder<ActivityProgressBloc, ActivityProgressState>(
              builder: (context, state) {
                if (state is ProgressLoading) {
                  return LoaderIndicator(
                    spinnerSize: 20,
                    spinnerColor: Colors.white,
                  );
                }
                if (state is ProgressCreated &&
                    state.createdProgress
                        .toReadingProgressEntity()!
                        .subactivitiesCompleted
                        .paraphrase) {
                  return Icon(Icons.check, color: Colors.green,);
                }

                if (state is ProgressUpdated &&
                    state.updatedProgress
                        .toReadingProgressEntity()!
                        .subactivitiesCompleted
                        .paraphrase) {
                  return Icon(
                    Icons.check,
                    color: Colors.green,
                  );
                }

                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ],
    );
  }

  Flexible _buildRichTextField() {
    return Flexible(
      child: TextField(
        controller: _controller,
        maxLines: 8,
        keyboardType: TextInputType.multiline,
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          hintText: "Escribe tu paráfrasis aquí...",
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.blueAccent, width: 1),
          ),
        ),
      ),
    );
  }

  Padding _buildFloatingActionButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60),
      child: FloatingActionButton.extended(
        onPressed: () => showParaphraseTipDialog(context),
        icon: const Icon(Icons.lightbulb),
        label: const Text(""),
        backgroundColor: Colors.amber,
      ),
    );
  }
}
