import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:client_app/core/routing/route_names.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/cubit/timer_cubit_attempt/timer_attempt_cubit.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/widgets/dialog_feedback.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/widgets/dialog_paraphrase_attempts.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/widgets/dialog_paraphrase_tip.dart';
import 'package:client_app/shared/widgets/loader_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../domain/entities/ai_reading_entity.dart';
import '../../../../presentation/bloc/activity_progress/activity_progress_bloc.dart';
import '../bloc/ai_reading_bloc/ai_reading_bloc.dart';
import '../cubit/attempts_cubit/attempts_cubit.dart';

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
    timerAttemptCubit.setStartTime(DateTime.now());
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

          context.read<ActivityProgressBloc>().add(
            UpdateProgressEvent(
              aiReadingId: widget.aiReadingEntity.aiReadingId,
              dataToUpdate: {"paraphraseCompleted": true},
            ),
          );
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
          canPop: false,
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Actividad de paráfrasis"),
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  timerAttemptCubit.setPlayCount(0);
                  timerAttemptCubit.setStartTime(DateTime.now());
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
              actions: [
                BlocConsumer<AttemptsCubit, AttemptsState>(
                  builder: (context, state) {
                    if (state is AttemptsLoading &&
                        state.attemptOperation == AttemptOperation.paraphrase) {
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
                    if (state is AttemptsError &&
                        state.attemptOperation == AttemptOperation.paraphrase) {
                      timerAttemptCubit.setStartTime(DateTime.now());
                      ToastMessageUtil.showToast(state.message, context);
                    }

                    if (state is AttemptParaphraseCreated) {
                      timerAttemptCubit.setStartTime(DateTime.now());
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
                        state
                            .createdProgress
                            .subactivitiesCompleted
                            .paraphrase) {
                      return Icon(Icons.check);
                    }

                    if (state is ProgressUpdated &&
                        state
                            .updatedProgress
                            .subactivitiesCompleted
                            .paraphrase) {
                      return Icon(Icons.check);
                    }

                    return SizedBox.shrink();
                  },
                ),
              ],
            ),
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
                                GestureDetector(
                                  onTap:
                                      () => setState(
                                        () => _isExpanded = !_isExpanded,
                                      ),
                                  child: Container(
                                    padding: const EdgeInsets.all(14),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade50,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: Colors.blueAccent,
                                        width: 0.6,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Ver párrafo original",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Icon(
                                          _isExpanded
                                              ? Icons.expand_less
                                              : Icons.expand_more,
                                          color: Colors.blueAccent,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                AnimatedCrossFade(
                                  firstChild: const SizedBox.shrink(),
                                  secondChild: Container(
                                    width: double.infinity,
                                    margin: const EdgeInsets.only(
                                      top: 8,
                                      bottom: 16,
                                    ),
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      widget.aiReadingEntity.content,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        height: 1.5,
                                      ),
                                    ),
                                  ),
                                  crossFadeState:
                                      _isExpanded
                                          ? CrossFadeState.showSecond
                                          : CrossFadeState.showFirst,
                                  duration: const Duration(milliseconds: 250),
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
                                SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed:
                                        isLoading
                                            ? null
                                            : () => _submitParaphrase(context),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blueAccent,
                                      disabledBackgroundColor:
                                          Colors.grey.shade400,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child:
                                        isLoading
                                            ? const SizedBox(
                                              height: 24,
                                              width: 24,
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                                strokeWidth: 2.5,
                                              ),
                                            )
                                            : const Text(
                                              "Evaluar paráfrasis",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                  ),
                                ),
                                SizedBox(height: 15),
                                _buildNextButton(),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                if (isLoading)
                  Container(
                    color: Colors.black.withValues(alpha: 0.3),
                    child: const Center(child: LoaderIndicator()),
                  ),
              ],
            ),
            floatingActionButton: _buildFloatingActionButton(context),
          ),
        );
      },
    );
  }

  Widget _buildNextButton() {
    return BlocConsumer<ActivityProgressBloc, ActivityProgressState>(
      builder: (context, state) {
        if (state is ProgressLoading) {
          return LoaderIndicator();
        }
        if (state is ProgressCreated &&
            state.createdProgress.subactivitiesCompleted.paraphrase) {
          return _buildButton(context);
        }
        if (state is ProgressUpdated &&
            state.updatedProgress.subactivitiesCompleted.paraphrase) {
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
          RouteNames.activityMainIdea,
          extra: widget.aiReadingEntity,
        );
      },
      icon: const Icon(Icons.arrow_forward),
      label: const Text('Siguiente actividad'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        minimumSize: const Size(double.infinity, 45),
      ),
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
        label: const Text("Tips"),
        backgroundColor: Colors.amber,
      ),
    );
  }
}
