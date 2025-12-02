import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/widgets/dialog_feedback_summary.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/widgets/dialog_summary_attempts.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/widgets/dialog_summary_tip.dart';
import 'package:client_app/features/home/children/courses/children/student_tracking/data/model/progress/progress_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../../../../shared/widgets/loader_indicator.dart';
import '../../../../domain/entities/ai_reading_entity.dart';
import '../../../../presentation/bloc/activity_progress/activity_progress_bloc.dart';
import '../bloc/ai_reading_bloc/ai_reading_bloc.dart';
import '../cubit/attempts_cubit/attempts_cubit.dart';
import '../cubit/timer_cubit_attempt/timer_attempt_cubit.dart';

class SummaryPage extends StatefulWidget {
  final AIReadingEntity aiReadingEntity;

  const SummaryPage({super.key, required this.aiReadingEntity});

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
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

  void _submitSummary(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (_controller.text.trim().isEmpty) {
      ToastMessageUtil.showToast("Escribe algo para continuar", context);
      return;
    }
    timerAttemptCubit.setCompleteTime(DateTime.now());
    context.read<AiReadingBloc>().add(
      EvaluateSummaryEvent(
        paragraph: widget.aiReadingEntity.content,
        summary: _controller.text,
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
            state.actionType == AiActionType.summary) {
          ToastMessageUtil.showToast(state.message, context);
        }
        if (state is SummarySuccess) {
          showFeedbackSummaryDialog(context, state.feedbackEntity);

          context.read<ActivityProgressBloc>().add(
            UpdateProgressEvent(
              aiReadingId: widget.aiReadingEntity.aiReadingId,
              dataToUpdate: {"completed": true, "summaryCompleted": true},
            ),
          );
          final timeSpentSec = timerAttemptCubit.totalTimeSec;
          context.read<AttemptsCubit>().createSummaryAttempt(
            aiReadingId: widget.aiReadingEntity.aiReadingId,
            accuracyScore: state.feedbackEntity.accuracyScore,
            coverageScore: state.feedbackEntity.coverageScore,
            clarityScore: state.feedbackEntity.clarityScore,
            feedback: state.feedbackEntity.feedback,
            timeSpentSec: timeSpentSec,
          );
        }
      },
      builder: (context, state) {
        final isLoading =
            state is AiReadingLoading &&
            state.actionType == AiActionType.summary;

        return PopScope(
          canPop: false,
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Actividad de resumen"),
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  timerAttemptCubit.setStartTime(DateTime.now());
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
              actions: [
                BlocConsumer<AttemptsCubit, AttemptsState>(
                  builder: (context, state) {
                    if (state is AttemptsLoading &&
                        state.attemptOperation == AttemptOperation.summary) {
                      return LoaderIndicator(spinnerSize: 20);
                    }
                    if (state is AttemptSummaryCreated) {
                      return IconButton(
                        onPressed: () {
                          showSummaryAttemptsDialog(
                            context,
                            widget.aiReadingEntity,
                          );
                        },
                        icon: Icon(Icons.book),
                      );
                    }
                    return IconButton(
                      onPressed: () {
                        showSummaryAttemptsDialog(
                          context,
                          widget.aiReadingEntity,
                        );
                      },
                      icon: Icon(Icons.book),
                    );
                  },
                  listener: (context, state) {
                    if (state is AttemptsError &&
                        state.attemptOperation == AttemptOperation.summary) {
                      timerAttemptCubit.setStartTime(DateTime.now());
                      ToastMessageUtil.showToast(state.message, context);
                    }

                    if (state is AttemptSummaryCreated) {
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
                        state.createdProgress
                            .toReadingProgressEntity()!
                            .subactivitiesCompleted
                            .summary) {
                      return Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(Icons.check),
                      );
                    }

                    if (state is ProgressUpdated &&
                        state.updatedProgress
                            .toReadingProgressEntity()!
                            .subactivitiesCompleted
                            .summary) {
                      return Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(Icons.check),
                      );
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
                                _buildSubmitButton(isLoading, context),
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
                    child: const Center(child: CircularProgressIndicator()),
                  ),
              ],
            ),
            floatingActionButton: _buildFloatingActionButton(context),
          ),
        );
      },
    );
  }

  SizedBox _buildSubmitButton(bool isLoading, BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: isLoading ? null : () => _submitSummary(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          disabledBackgroundColor: Colors.grey.shade400,
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
                : const Text("Enviar resumen", style: TextStyle(fontSize: 16)),
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
        onPressed: () => showSummaryTips(context),
        icon: const Icon(Icons.lightbulb),
        label: const Text("Tips"),
        backgroundColor: Colors.amber,
      ),
    );
  }
}
